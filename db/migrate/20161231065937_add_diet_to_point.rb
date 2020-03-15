class AddDietToPoint < ActiveRecord::Migration[5.0]
  def change
    add_reference :points, :diet, foreign_key: true, on_delete: :cascade
  end
end