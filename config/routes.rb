Rails.application.routes.draw do
  get 'weather/form'

  post 'weather/display'

  root 'weather#form'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
