class AlterTypeToShoetype < ActiveRecord::Migration
  def change
    rename_column :shoes, :type, :shoe_type
  end
end
