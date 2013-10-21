class ClientUrl < ActiveRecord::Base
  attr_accessible :client_id, :name, :url
  belongs_to :client
end
