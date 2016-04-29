Booqcms::Engine.routes.draw do

  # scope "/admin" do
       devise_for :users, class_name: "Booqcms::User", module: :devise
  # end

  #devise_for :users, class_name: "Booqcms::User", path: 'admin/users'

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
