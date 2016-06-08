require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/fumikiri_app/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/fumikiri_app_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/fumikiri_app_development'
  #    adapter type: :sql, uri: 'mysql://localhost/fumikiri_app_development'
  #
  
  ## This is a test app no need for real persistance
  adapter type: :memory, uri: 'memory://localhost/fumikiri_app_development'

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:

  mapping "#{__dir__}/config/mapping"

end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/fumikiri_app/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
