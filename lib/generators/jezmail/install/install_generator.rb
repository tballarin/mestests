require 'rails'

module Jezmail
  module Generators
    class InstallGenerator < Rails::Generators::Base     
		def copy_migrations
      		rake("railties:install:migrations")
      		rake("db:migrate")
		end
		def copy_route
      		route('mount Jezmail::Engine, at: "/webmail"')
		end
		desc "This generator install jezmail in http:yourdomaine.com/webmail" 
    end
  end
end