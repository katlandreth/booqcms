Booqcms::Engine.routes.draw do

  devise_for :users, class_name: "Booqcms::User", module: :devise
  get 'tags/:tag', to: 'entries#index', as: "tag"
  get 'media-library/:entry_id', to: 'media#index', as: "media_library"
  get 'media-show/:id/:entry_id', to: 'media#show', as: "media_show"
  get 'media-new/:entry_id', to: 'media#new', as: "media_new"
  get 'analytics', to: 'analytics#index', as: 'analytics_dashboard'

  resources :media do
    collection do
      delete :destroy_multiple
    end
  end
  resources :entries do
    get 'preview'
    patch 'publish'
    collection do
      delete :destroy_multiple
    end
  end

 root to: 'entries#index'
end
