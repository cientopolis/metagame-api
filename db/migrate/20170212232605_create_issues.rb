class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.belongs_to :player, null: false
      t.belongs_to :badge,  null: false
      t.timestamps null: false
    end
  end
end
