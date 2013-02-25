Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :renters do
    resources :renters, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :renters, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :renters, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
