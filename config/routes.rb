Rails.application.routes.draw do

  #get '/stocks/update_blood_availabilities'
  get '/require_donars/search_form'
  get '/require_donars/results'
  resources :require_donars
  get '/blood_banks/require_donar'

  namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      resources :blood_banks
    end
  end


  devise_for :users,controllers: {registrations: 'registrations'} #for asking username with password and email creted in registrations controller(overrid this registration controller and use our registrtio controller as key is registration value is registration)

  
  scope "/admin" do   #  for users controller(admin/users), for creating roles in checkbox 
    resources :users  
  end

  resources :roles
  
  

  resources :blood_banks
  resources :blood_availabilities
  resources :stocks
  resources :person_details
  resources :campaigns
  resources :localities
  resources :states
  resources :districts

  resources :orders
  resources :hospitals
  resources :contacts, only: [:index]
  resources :campaign_shedules, only: [:index]

  

  



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
    #root 'person_details#new'
    #'new_user_registration_path'
    root'blood_banks#index' 
    #root'person_details#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
