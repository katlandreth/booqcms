Booqcms::Engine.routes.draw do
  scope "/:content_class" do
    resources :entries do
      get 'preview' 
      collection do
        delete :destroy_multiple
      end
    end
  end
end
