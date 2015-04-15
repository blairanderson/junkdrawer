class ApiCache < ActiveRecord::Base

  IN_2_HOURS = 2.hours

  belongs_to :user
  validates_formatting_of :endpoint, using: :url


  def self.get(endpoint)
    Rails.cache.fetch(endpoint, expires_in: IN_2_HOURS) do
      response = Faraday.get(endpoint)
      response.body
    end
  end

  def get
    Rails.cache.fetch("#{user_id}/#{endpoint}", expires_in: settings[:expires_in] || ::IN_2_HOURS) do
      response = Faraday.get(endpoint)
      response.body
    end
  end
end
