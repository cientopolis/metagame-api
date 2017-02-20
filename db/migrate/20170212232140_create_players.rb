class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :email, null: false
      t.belongs_to :player_range
      t.timestamps null: false
    end
  end
end
