require 'rails'

module Jezmail
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      route 'mount Blorgh::Engine, at: "/blog"'
      rake 'railties:install:migrations'
      rake 'db:migrate'
    end
  end
end