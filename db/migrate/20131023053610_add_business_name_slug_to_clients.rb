class AddBusinessNameSlugToClients < ActiveRecord::Migration
  def change
    add_column :clients, :business_name_slug, :string
  end
end
