require 'rails'

module Jezmail
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
	desc "This generator creates an initializer file at config/initializers"      

      rake 'railties:install:migrations'
      rake 'db:migrate'

    end
  end
end