class ApiCache < ActiveRecord::Base

  EXPIRES_IN = 2.hours

  belongs_to :user
  validates_formatting_of :endpoint, using: :url


  def self.get(endpoint)
    Rails.cache.fetch(endpoint, expires_in: EXPIRES_IN) do
      response = Faraday.get(endpoint)
      response.body
    end
  end

  def get
    Rails.cache.fetch("#{user_id}/#{endpoint}", expires_in: settings[:expires_in] || ::EXPIRES_IN) do
      response = Faraday.get(endpoint)
      response.body
    end
  end
end
