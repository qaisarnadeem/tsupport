Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'auth/sign_in' => redirect('/#/session/sign-in')
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :comments ,only: [:create]
  resources :tickets , only: [:create , :index , :show] do
   member do
    put :change_status
   end
  end
  match "*path" => redirect('/#/%{path}'),via: :all
end

