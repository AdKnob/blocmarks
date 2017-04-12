Rails.application.routes.draw do

  root :to => "home#index"

  resources :topics do
    resources :bookmarks
  end

  devise_for :users

end
