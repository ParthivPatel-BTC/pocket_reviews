class AddThankYouContentToClients < ActiveRecord::Migration
  def change
    add_column :clients, :thank_you_content, :text
  end
end
