class AddFullNameToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :full_name, :string
  end
end
