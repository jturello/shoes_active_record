class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :shoes, :stores do |t|
       t.index :shoe_id
       t.index :store_id
     end
  end
end
