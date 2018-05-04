Rails.application.routes.draw do
  resources :comments, except: [:index, :show]
  # resources :likes
  resources :ideas
  get 'static_pages/home'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks',
        passwords: 'users/passwords'
        #confirmations: 'users/confirmations',
        #unlocks: 'users/unlocks'
      }

      devise_scope :user do
        get 'entrar', to: 'users/sessions#new', as: :entrar
        get 'registro', to: 'users/registrations#new', as: :registro
      end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  post '/likes/tgol/:user_id/:idea_id', to: 'likes#the_god_of_likes', as: :tgol
end
