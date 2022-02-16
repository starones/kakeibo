Rails.application.routes.draw do
 root "tops#index"
 post "income_values/new(/:name)" => "income_values#new"

 resources :incomes
 resources :fixedcosts
 resources :variablecosts
 resources :income_values
 resources :fixedcosts_values
end
