Rails.application.routes.draw do
  resources :products
  root 'home#index'
  
  get 'guides/submit' => 'home#submit'
  get 'home/tool' => 'home#tool'
  get 'home/show' => 'home#show'
  
  post 'home/state' => 'home#state_update'
  
  post 'create_board' => 'home#create_board'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
