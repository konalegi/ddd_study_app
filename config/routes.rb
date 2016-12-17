Rails.application.routes.draw do
  resources :profiles, only: [:create, :show], defaults: { format: :json } do
    member do
      post :add_car
    end
  end

end
