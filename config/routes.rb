Rails.application.routes.draw do
  get 'book_faq/show'

  resources :posts, only: [:show, :index]

  get 'tags/:tag', to: 'posts#index', as: "tag"
  get 'filter', to: 'posts#filter', as: "filter"
  get 'gimp-book', to: 'book_sales#book', as: "gimp_book"
  get 'privacy-policy', to:'privacy_policy#show', as: "privacy_policy"
  get 'practice-images', to:'practice_images#show', as: "practice_images"
  get 'book-faq', to:'book_faq#show', as: "book_faq"

  mount Dashboard::Engine, at: '/admin'

  Post.where.not(slug: nil).all.each do |blogpost|
     get '/:slug', to: 'posts#slug'
  end
  root to: 'posts#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
