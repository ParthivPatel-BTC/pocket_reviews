class ClientUrl < ActiveRecord::Base
  attr_accessible :client_id, :name, :directory_url
  belongs_to :client, dependent: :destroy
end
