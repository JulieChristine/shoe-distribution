class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table(:brands) do |r|
      r.column(:name_brand, :string)
    end
  end
end
