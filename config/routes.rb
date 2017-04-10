Rails.application.routes.draw do

  get 'topics/index'

  get 'topics/show'

  get 'topics/new'

  get 'topics/edit'

  root :to => "home#index"
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
