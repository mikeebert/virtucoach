class RenameCoachToEditinRelationships < ActiveRecord::Migration

  def change
    rename_column :relationships, :coach , :edit
  end

end
