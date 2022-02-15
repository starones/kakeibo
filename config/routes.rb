Rails.application.routes.draw do
 root "tops#index"
 resources :incomes
 resources :fixedcosts
 resources :variablecosts
 resources :income_values
end
