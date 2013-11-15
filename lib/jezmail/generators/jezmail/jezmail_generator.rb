require 'rails'

module Jquery
  module Generators
    class JezmailGenerator < Rails::Generators::NamedBase
      route 'mount Blorgh::Engine, at: "/blog"'
      rake 'railties:install:migrations'
      rake 'db:migrate'
    end
  end
end