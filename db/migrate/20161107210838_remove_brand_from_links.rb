class RemoveBrandFromLinks < ActiveRecord::Migration[5.0]
  def change
  	remove_column :links, :brand
  end
end
