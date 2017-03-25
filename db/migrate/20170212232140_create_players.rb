class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :email, null: false
      t.timestamps null: false

      t.belongs_to :player_rank
    end
  end
end
