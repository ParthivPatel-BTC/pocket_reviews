class AddTwilioNumberToClients < ActiveRecord::Migration
  def change
    add_column :clients, :twilio_number, :string
  end
end
