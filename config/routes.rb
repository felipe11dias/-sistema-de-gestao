Rails.application.routes.draw do

  resources :comments
  resources :companies
  resources :posts

  devise_for :users, path: 'users', controllers: {sessions: "users/sessions", registrations: "users/registrations"}

  devise_scope :user do
    get "/register", to: "users/registrations#new"
    get "/administration/users", to: "pages#admin_users"
    get "/comments/posts/:post_id", to: "comments#post_index"
    get "/comments/posts/new/:post_id", to: "comments#new"
    delete "/administration/users/delete/:id", to: "pages#delete_user"
    authenticated :user do
      root 'pages#timeline', as: :authenticated_root
    end
    unauthenticated do
      root 'pages#home', as: :unauthenticated_root
    end
  end
end
