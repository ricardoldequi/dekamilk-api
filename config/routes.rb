Rails.application.routes.draw do
  namespace :api do
     namespace :v1 do
        resources :usuario
        resources :operacao
        resources :funcao
        resources :cliente
        resources :animal
        resources :raca
        resources :fornecedor
        resources :precounitariolitro
        resources :movimento do
          collection do
            get 'entrada'
            get 'saida'
            get 'todos'
            get 'relatorio'
          end
        end
        resources :vacina
        resources :calendariovacinacao
        post "/login", to: "usuario#login"

        # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

        # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
        # Can be used by load balancers and uptime monitors to verify that the app is live.
        get "up" => "rails/health#show", as: :rails_health_check

        # Defines the root path route ("/")
        # root "posts#index"
    end
  end
end