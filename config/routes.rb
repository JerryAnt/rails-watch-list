Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# A user can see all the lists
# GET "lists"
# A user can see the details of a given list and its name
# A user can create a new list
resources :lists, only: [:index, :show, :new, :create]
end
