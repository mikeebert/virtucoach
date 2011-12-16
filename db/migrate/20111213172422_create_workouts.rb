class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.date :date
      t.text :description
      t.boolean :complete, default:false
      t.integer :miles
      t.integer :duration
      t.integer :RPE

      t.timestamps
    end
  end
end
