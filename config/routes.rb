Rails.application.routes.draw do

  root to: 'admins/animes#top'

  devise_for :users, controllers: {
  sessions: 'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
  resources :animes do
    resources :episodes do
      resources :reviews
    end
  end
  resources :users
  resources :my_lists
  resources :requests

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
    }
    namespace :admins do
      resources :animes do
        resources :episodes do
          resources :reviews
        end
      end
      resources :users ,only:[:index, :show, :edit, :update]
      resources :requests, only: [:index, :show]
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
