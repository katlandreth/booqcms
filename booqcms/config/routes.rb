Booqcms::Engine.routes.draw do
  resources :media
  resources :entries do
    get 'preview'
    collection do
      delete :destroy_multiple
    end
  end
end
