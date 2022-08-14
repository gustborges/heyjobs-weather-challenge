Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'weather/temperature', to: 'weather#temperature'
  post 'weather/wind', to: 'weather#wind'
  post 'weather/clouds', to: 'weather#clouds'

end
