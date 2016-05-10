Booqcms::Engine.routes.draw do

  devise_for :users, class_name: "Booqcms::User", module: :devise
  get 'tags/:tag', to: 'entries#index', as: "tag"

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

 root to: 'entries#index'
end
