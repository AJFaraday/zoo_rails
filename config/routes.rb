ZooRails::Application.routes.draw do

  resources :species

  resources :animals do
    member do
      get :feed
    end
  end

end
