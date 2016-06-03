class User
  include Hanami::Entity

  attributes :id, :name, :role, :jti
end
