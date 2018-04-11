Rails.application.routes.draw do

  get "/apis", action => "apis#index"
  get "/voice", action => "voices#index"

#  namespace :api, {format: 'json'} do
#    namespace :orders do
#      get "/", action => "index"
#    end
#  end


end
