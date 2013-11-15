require 'rails'

module Jezmail
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      
      def majroute
      	route 'mount Jezmail::Engine, at: "/webmail"'
      end
      
      def majbdd
      rake 'railties:install:migrations'
      rake 'db:migrate'
      end
    end
  end
end