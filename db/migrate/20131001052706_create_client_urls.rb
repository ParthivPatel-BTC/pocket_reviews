class CreateClientUrls < ActiveRecord::Migration
  def change
    create_table :client_urls do |t|
      t.integer :client_id
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
