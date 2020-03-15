class AddUserToDiet < ActiveRecord::Migration[5.0]
  def change
    add_reference :diets, :user, foreign_key: true, on_delete: :cascade
  end
end