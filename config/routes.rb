Rails.application.routes.draw do
  concern :paginatable do
    get "(page/:page)", action: :index, on: :collection
  end

  namespace :admin do
    root "dashboard#index"

    namespace :article, path: "articles" do
      resources :columns, concerns: :paginatable
      resources :posts, concerns: :paginatable
    end

    namespace :user, path: "users" do
      resources :accounts, except: [:new, :create], concerns: :paginatable
    end
  end

  namespace :article, path: "articles" do
    get "(page/:page)", controller: :columns, action: :index

    resources :columns, only: [:show], shallow: true do
      get "page/:page", action: :show, on: :member
      resources :posts, only: [:show], shallow: true
    end
  end

  namespace :user, path: "users" do
    resources :accounts, path: "", only: [:show]
  end

  devise_for :users, path: "user", class_name: "User::Account", controllers: {
    registrations: "user/registrations"
  }

  get "about", to: "welcome#about"
  get "privacy", to: "welcome#privacy"
  root "welcome#index"

  match "*path", via: :all, to: "application#not_found"
end
