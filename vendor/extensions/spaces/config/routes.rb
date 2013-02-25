Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :spaces do
    resources :spaces, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :spaces, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :spaces, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
