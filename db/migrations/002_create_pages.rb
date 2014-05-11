Sequel.migration do
  change do
    create_table(:pages) do
      primary_key :id
      String    :h1,        :null => false
      String    :content,   :text => true
      DateTime  :created_at
      DateTime  :updated_at
    end
  end
end
