class Review < ActiveRecord::Base
  attr_accessible :comment, :rating, :submitted_on
  attr_accessible :client_id, :customer_id, :posted_status, :posted_on


  belongs_to :client
  belongs_to :customer

  has_many :review_statuses

  def self.count_posted_reviews
    where('created_at >= ?', Time.now-30.days).count
  end
end