class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :shoes_stores, :shoes
    add_foreign_key :shoes_stores, :stores
  end
end
