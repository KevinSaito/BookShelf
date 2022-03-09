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
    resources :favo_images do
      resource :favorites, only:[:create, :destroy]
      resources :favo_comments, only:[:create, :destroy]
    end
    resources :users do
      member do
        get :follows, :followers
      end
      resource :relationships, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
