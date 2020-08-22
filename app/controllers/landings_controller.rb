class LandingsController < ApplicationController
  def index
    @apps = [
      {title: "ApiSlug", link_to: api_slug_index_path},
      {title: "XMLtoJSON", link_to: converters_path}
    ]
    respond_to do |format|
      format.html
      format.json do
        success_api_response({apps: @apps})
      end
    end
  end
end
