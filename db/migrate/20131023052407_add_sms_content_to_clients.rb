class AddSmsContentToClients < ActiveRecord::Migration
  def change
    add_column :clients, :sms_content, :text
  end
end
