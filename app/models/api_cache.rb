class ApiCache < ActiveRecord::Base
  belongs_to :user
  validates_formatting_of :endpoint, using: :url

  def self.expires_in
    6.hours
  end

  def self.get(endpoint)
    Rails.cache.fetch(endpoint, expires_in: expires_in) do
      response = Faraday.get(endpoint)
      response.body
    end
  end

  def get
    Rails.cache.fetch("#{user_id}/#{endpoint}", expires_in: settings[:expires_in] || ApiCache.expires_in) do
      response = Faraday.get(endpoint)
      response.body
    end
  end
end
