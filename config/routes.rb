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
      resources :favo_comments, only:[:create]
    end
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
