ROM::SQL.migration do
  change do
    create_table :profiles do
      column :id, :uuid, primary_key: true
      column :payload, :jsonb
    end

  end
end
