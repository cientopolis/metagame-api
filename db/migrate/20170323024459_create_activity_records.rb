class CreateActivityRecords < ActiveRecord::Migration
  def change
    create_table :activity_records do |t|
      t.integer :value, default: 0
      t.integer :last_value, default: 0
      t.string :type

      t.belongs_to :player_record
    end
  end
end
