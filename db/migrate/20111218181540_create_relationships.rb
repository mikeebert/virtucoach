class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :owner_id
      t.integer :guest_id
      t.boolean :coach, default:false
      t.timestamps
    end
  end
end
