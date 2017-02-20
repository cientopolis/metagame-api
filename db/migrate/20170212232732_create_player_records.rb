class CreatePlayerRecords < ActiveRecord::Migration
  def change
    create_table :player_records do |t|
      t.integer :value, null: false, default: 0
      t.integer :last_value, default: 0

      t.belongs_to :player, null: false
      t.belongs_to :project, null: false
      t.belongs_to :activity_type,  null: false

      t.timestamps null: false
    end
  end
end
