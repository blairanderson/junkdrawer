class ApiSlug::ApiKeysController < ApplicationController

  def index
    if current_user
      @key = ApiSlugApiKey.where(user_id: current_user.id).first_or_create
      current_user.key = @key
    end
  end

  def show
  end

  def reset
  end
end
