Rails.application.routes.draw do
  root to:'public/homes#top'
  
  #顧客用
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  #顧客側
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
