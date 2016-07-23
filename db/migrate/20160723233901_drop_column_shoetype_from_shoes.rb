class DropColumnShoetypeFromShoes < ActiveRecord::Migration
  def change
    remove_column :shoes, :shoe_type 
  end
end
