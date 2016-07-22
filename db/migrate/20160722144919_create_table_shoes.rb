class CreateTableShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.column :brand, :string, :null => false
      t.column :type, :string
    end
  end
end
