Rails.application.routes.draw do

  devise_for :users, controllers: {
  sessions: 'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
  resources :animes do
    resources :my_lists, only: [:create, :destroy]
    resources :episodes do
      resources :reviews
    end
  end
  get  '/users/confirmation' => 'users#confirmation'
  patch '/users/withdraw' => 'users#withdraw'
  get '/review/:id' => "reviews#show"
  resources :users
  resources :requests

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
    }
    namespace :admins do
      root to: 'animes#top'
      resources :animes do
        resources :episodes
      end
      resources :reviews
      resources :users ,only:[:index, :show, :edit, :update]
      resources :requests, only: [:index, :show]
    end
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get 'search' => 'animes#search'
    post '/homes/guest_sign_in', to: 'homes#new_guest'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
