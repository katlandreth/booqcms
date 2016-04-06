Booqcms::Engine.routes.draw do
  
  resources :entries do
    get 'preview'
    collection do
      delete :destroy_multiple
    end
  end
end
