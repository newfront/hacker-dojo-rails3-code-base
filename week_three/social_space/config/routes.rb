SocialSpace::Application.routes.draw do
  get "main/index"
  
  # main landing page
  root :to => "main#index"
end
