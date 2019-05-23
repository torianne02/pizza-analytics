Sequel.migration do
  change do
    create_table(:people) do
      primary_key :id
      String :name, :null => false, unique: true
    end
  end
end
