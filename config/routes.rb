Rails.application.routes.draw do
  root to:'public/homes#top'

  #ユーザー用
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  #ユーザー側
  scope module: :public do
    get 'homes/top'
    get 'homes/about'
    get 'users/:id/favorites' => 'users#favorites', as:'user_favorites'
    resources :favo_images do
      collection do
        get:search
      end
      resource :favorites, only:[:create, :destroy]
      resources :favo_comments, only:[:create, :destroy]
    end
    resources :users do
      member do
        get :follows, :followers
      end
      collection do
        get :favorites
      end
      resource :relationships, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
