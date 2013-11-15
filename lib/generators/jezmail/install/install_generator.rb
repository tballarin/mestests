require 'rails'

module Jezmail
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
	desc "This generator creates an initializer file at config/initializers"      
		def installBDD
      		rake("railties:install:migrations")
      		rake("db:migrate")
			desc "BDD installé"
		end
		def configroute
      		route('mount Blorgh::Engine, at: "/blog"')
      		desc "Route configuré"
		end
    end
  end
end