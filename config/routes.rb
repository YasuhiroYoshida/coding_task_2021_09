Rails.application.routes.draw do
  get 'sizes/new'
  get 'sizes/convert'
  namespace :api do
    namespace :v1 do
      get 'sizes/convert'
    end
  end
end
