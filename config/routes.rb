Rails.application.routes.draw do
  get 'balanco/new'

  get 'users/new'

  get 'sessions/new'

  resources :despesas
  resources :receita_recebidas
  resources :receita_a_recebers
  resources :descricao_tipos
  resources :moradors
  resources :veiculos
  resources :funcionarios
  resources :apartamentos
  resources :usuarios
  resources :condominios
  resources :users
  resources :balanco
  
  
  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  root 'sessions#new'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
