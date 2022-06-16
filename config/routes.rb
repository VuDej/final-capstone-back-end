Rails.application.routes.draw do
  get 'current_user/index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :cars, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
