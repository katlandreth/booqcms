Booqcms::Engine.routes.draw do
  resources :media do
    collection do
      delete :destroy_multiple
    end
  end
  resources :entries do
    get 'preview'
    collection do
      delete :destroy_multiple
    end
  end
end
