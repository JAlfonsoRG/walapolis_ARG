Rails.application.routes.draw do
  get 'static_pages/home'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords'
        #confirmations: 'users/confirmations',
        # omniauth_callbacks: 'users/omniauth_callbacks',
        #unlocks: 'users/unlocks'
      }

      devise_scope :user do
        get 'entrar', to: 'users/sessions#new', as: :entrar
        get 'registro', to: 'users/registrations#new', as: :registro
      end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
