class CreatePlayerRanks < ActiveRecord::Migration
  def change
    create_table :player_ranks do |t|
      t.string  :name,  null: false
      t.integer :value, null: false
      t.timestamps null: false
    end
  end
end
