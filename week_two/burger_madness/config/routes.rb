BurgerMadness::Application.routes.draw do
  get "order/index"

  get "order/show/"
  
  get "order/create"
  
  get "order/new"

  get "burger/index"

  get "burger/new"

  post "burger/create"

  get "burger/edit"

  get "burger/destroy"
  
  get "burger/show"
  
  get "burger/add_topping"
  
  post "burger/do_add_topping"

  match "/burger/list" => "burger#index"
  
  match "/order/list/:id"  => "order#index"
  
  root :to => "burger#index"

end