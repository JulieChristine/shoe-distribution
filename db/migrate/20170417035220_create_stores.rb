class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table(:stores) do |r|
      r.column(:name_store, :string)
      r.column(:location, :string)
    end
  end
end
