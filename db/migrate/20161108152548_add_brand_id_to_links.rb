class AddBrandIdToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :brand_id, :integer
    add_index :links, :brand_id
  end
end
