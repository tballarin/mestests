require 'rails'

module Jezmail
  module Generators
    class InstallGenerator < Rails::Generators::Base
	desc "This generator install jezmail in http:yourdomaine.com/webmail"      
		def copy_migrations
      		rake("railties:install:migrations")
      		rake("db:migrate")
			desc "BDD installé"
		end
		def copy_route
      		route('mount Jezmail::Engine, at: "/webmail"')
      		desc "Route configuré"
		end
    end
  end
end