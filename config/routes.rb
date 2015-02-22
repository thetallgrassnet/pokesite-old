Rails.application.routes.draw do
  namespace :admin do
    root "dashboard#index"

    namespace :user, path: "users" do
      resources :accounts, except: [:new, :create]
    end
  end

  namespace :user, path: "users" do
    resources :accounts, path: "", only: [:show]
  end

  devise_for :users, path: "user", class_name: "User::Account", controllers: {
    registrations: "user/registrations"
  }

  root "welcome#index"
end
