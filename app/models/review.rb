class Review < ActiveRecord::Base
  attr_accessible :comment, :rating, :submitted_on
  attr_accessible :client_id, :customer_id

  belongs_to :client
  belongs_to :customer

  has_many :review_statuses
end