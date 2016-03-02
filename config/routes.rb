Rails.application.routes.draw do
  namespace :admin do
    root "dashboard#index"

    namespace :article, path: "articles" do
      resources :columns
    end

    namespace :user, path: "users" do
      resources :accounts, except: [:new, :create]
    end
  end

  namespace :article, path: "articles" do
    resources :columns, only: [:show], shallow: true do
      resources :posts, only: [:show], shallow: true
    end
  end

  namespace :user, path: "users" do
    resources :accounts, path: "", only: [:show]
  end

  devise_for :users, path: "user", class_name: "User::Account", controllers: {
    registrations: "user/registrations"
  }

  root "welcome#index"

  match "*path", via: :all, to: "application#not_found"
end
