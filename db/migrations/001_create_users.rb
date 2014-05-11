Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String    :email,           :null => false
      String    :password_digest, :null => false
      DateTime  :created_at
      DateTime  :updated_at
    end
  end
end
