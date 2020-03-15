class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :username, limit: 50, index: { unique: true }
      t.string :email, limit: 150, index: { unique: true }
      t.string :password, limit: 10
      t.timestamps
    end
  end
   def down
     drop_table :user
   end
end
