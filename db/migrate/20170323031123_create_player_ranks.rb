class CreatePlayerRanks < ActiveRecord::Migration
  def change
    create_table :player_ranks do |t|
      t.string :name
      t.string :type
    end
  end
end
