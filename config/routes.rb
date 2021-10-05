Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # A user can see all the lists
  # GET "lists"
  # A user can see the details of a given list and its name
  # A user can create a new list
  root to: "lists#index"
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
  # A user can add a new bookmark (movie/list pair) to an existing list
  # -> so bookmark is nested in lists

  # GET "lists/42/bookmarks/new"
  # -> so we have bookmarks#new ...

  # POST "lists/42/bookmarks"
  # -> ...and bookmarks#create
  # A user can delete a bookmark from a list.
  # DELETE "bookmarks/25"
   # -> so we have bookmarks#destroy
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy
end
