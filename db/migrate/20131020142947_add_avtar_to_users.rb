class AddAvtarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avtar, :string
  end
end
