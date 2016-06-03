Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id
      column :name,     String, null: false
      column :role,     String, null: false
      column :jti,      String, null: false
    end
  end
end
