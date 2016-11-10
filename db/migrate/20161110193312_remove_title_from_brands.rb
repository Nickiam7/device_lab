class RemoveTitleFromBrands < ActiveRecord::Migration[5.0]
  def change
  	remove_column :brands, :title
  end
end
