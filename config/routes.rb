Nethermead::Application.routes.draw do
  get "search_results/show"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'search#index'

  # Example of regular route:
  get 'search' => 'search#index'
  get 'companies' => 'search#companies'
  post 'search' => 'search#find'
  
  get 'search/:slug/:state/:class' => 'search#show'
  get 'search/:slug/:state/:class/map' => 'search#map'
  get 'search/:slug/:state/:class/export' => 'search#export'
  post 'search/:slug/:state/:class/share' => 'search#share'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  get 'company/:id/markets' => 'company#markets'

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :search_results
  resources :interested_users

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
