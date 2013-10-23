class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :business_name
      t.string :contact_person
      t.string :contact_number
      t.string :address
      t.string :company_representative
      t.string :email_address
      t.integer :user_id
      t.boolean :active
      t.string :short_url

      t.timestamps
    end
    add_attachment :clients, :company_logo

    add_index :clients, :user_id
  end
end
