Rails.application.routes.draw do
  resources :compromissos
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
  
  get    'relatorio'   => 'balanco#index'
  post   'relatorio'   => 'balanco#relatorio'
  
  get    'despesa_mensal'   => 'despesas#mensal'
  post   'despesa_mensal'   => 'despesas#mult_create'
  
  get    'receita_mensal'   => 'receita_recebidas#mensal'
  post   'receita_mensal'   => 'receita_recebidas#mult_create'
  
  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  root 'sessions#new'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
