class AddTitleToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :title, :string
  end
end
