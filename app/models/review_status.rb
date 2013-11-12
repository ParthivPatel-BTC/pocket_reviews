class ReviewStatus < ActiveRecord::Base
  attr_accessible :client_url_id, :is_posted, :is_visible, :posted_on, :review_id, :visible_on

  belongs_to :review
  belongs_to :client_url

  def self.count_visible_review
    where('is_visible = ?', 'true')
    .where('created_at >= ?', Time.now-30.days).count
  end
end