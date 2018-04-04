Rails.application.routes.draw do
  get 'transactions/deposit'

  get 'transactions/transfer'

  get 'transactions/withdraw'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create] do
    collection do
      post 'signin'
    end
  end
  resources :cards, only: [:create, :destroy] 
  
end
