class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :note
      t.integer :user_id
      t.integer :workout_id

      t.timestamps
    end
  end
end
