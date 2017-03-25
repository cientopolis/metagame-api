class CreatePlayerRecords < ActiveRecord::Migration
  def change
    create_table :player_records do |t|
      t.belongs_to :player, null: false
      t.belongs_to :project, null: false
      t.timestamps null: false
    end
  end
end
