Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "articles#index"

  resources :articles do
    member do
      post 'upvote'
      delete 'downvote'
    end
  end
end
