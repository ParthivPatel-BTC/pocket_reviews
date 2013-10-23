class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :representative
      t.string :email
      t.string :url

      t.timestamps
    end
  end
end
