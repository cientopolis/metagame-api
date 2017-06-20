class AddIndexesToTables < ActiveRecord::Migration
  def up
    add_index :players, :email
    add_foreign_key :badges, :projects
    add_foreign_key :issues, :players
    add_foreign_key :issues, :badges
    add_foreign_key :player_records, :players
    add_foreign_key :player_records, :projects
    add_foreign_key :activity_records, :player_records
    add_foreign_key :players, :player_ranks

  end

  def down
    remove_index :players, :email
    remove_foreign_key :badges, :projects
    remove_foreign_key :issues, :players
    remove_foreign_key :issues, :badges
    remove_foreign_key :player_records, :players
    remove_foreign_key :player_records, :projects
    remove_foreign_key :activity_records, :player_records
    remove_foreign_key :players, :player_ranks
  end
end
