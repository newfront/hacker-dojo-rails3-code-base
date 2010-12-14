FauxTwitter::Application.routes.draw do
  
  get "main/index"

  get "user_preference/show"

  get "user_preference/new"

  get "user_preference/add"

  get "user_preference/edit"

  get "user_preference/destroy"

  
  
  match 'home' => "main#index"
  match 'signup' => "signup#new"
  
  match 'session/destroy' => "session#destroy"
  match 'status/new' => "status#new"

  resources :user
  resources :status 
  resources :session
  resources :signup

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

    root :to => "main#index"
end
