class ApiCache < ActiveRecord::Base
  belongs_to :user
  validates_formatting_of :endpoint, using: :url
end
