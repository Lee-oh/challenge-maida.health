class CreateDiets < ActiveRecord::Migration[5.0]
  def up
     create_table :diets do |t|
       t.string :title, limit: 50
       t.text :description, limit: 250
       t.string :schedule
       t.date :start
       t.date :finish
       t.string :period
       t.float :height
       t.float :weight
       t.float :target_weight
       t.timestamps
     end
   end
   def down
    drop_table :diet
   end
end