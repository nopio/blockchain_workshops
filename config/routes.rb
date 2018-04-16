Rails.application.routes.draw do
  root to: 'home#welcome'
  devise_for :users

  resources :users do
    resources :pictures do

      get :add_owner
      post :transfer
    end
  end
  resources :ownership_proofs, controller: :ownerships, as: :ownerships, only: [:new, :create, :index] do
    collection do
      get :prove_ownership
      post :send_prove
      get :proof_added
    end
  end
end
