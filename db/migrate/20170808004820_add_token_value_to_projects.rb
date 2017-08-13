class AddTokenValueToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :token_value, :string
  end
end
