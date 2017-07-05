class AddImageToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :image, :string, null:true
  end
end
