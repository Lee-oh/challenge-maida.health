class CreatePoints < ActiveRecord::Migration[5.0]
  def up
     create_table :points do |t|
       t.string :title, limit: 50
       t.date :schedule
       t.float :weight
       t.timestamps
     end
   end
   def down
    drop_table :points 
   end
end