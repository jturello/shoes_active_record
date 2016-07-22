class CreateTableStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.column :name, :string, :null => false
      t.column :location, :string
    end
  end
end
