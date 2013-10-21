class Client < ActiveRecord::Base
  attr_accessible :company_name, :email, :representative, :url, :client_urls_attributes

  validates_presence_of :company_name, :email, :representative, :url
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
    message: "address is invalid" }, unless: "email.blank?"
  has_many :client_urls
  accepts_nested_attributes_for :client_urls, :allow_destroy => true
end