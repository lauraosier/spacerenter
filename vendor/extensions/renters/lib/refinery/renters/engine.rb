module Refinery
  module Renters
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Renters

      engine_name :refinery_renters

      initializer "register refinerycms_renters plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "renters"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.renters_admin_renters_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/renters/renter',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Renters)
      end
    end
  end
end
