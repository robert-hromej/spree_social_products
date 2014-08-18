Spree::Core::Engine.routes.append do
  namespace :admin do
    resource :social, :only => [:edit, :update], :controller => "social"
    resources :reports, :only => [] do
      collection do
        get   :social_products
        post  :social_products
      end
    end
  end
end
