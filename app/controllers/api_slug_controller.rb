class ApiSlugController < ApplicationController

  def index
  end

  def show
    if params[:endpoint].present?
      url = params.delete(:endpoint)

      endpoint_params = params.except(:action, :controller, :id, :endpoint)

      render json: ApiCache.get("#{url}?#{endpoint_params.to_param}")
    else
      render json: ApiCache.get('https://api.github.com/users/blairanderson/repos')
    end
  end

  def secure
    if !params[:endpoint].present
      render json: {
          message: "We will let you pass us headers, and we'll pass them on. The headers are hashed and included in the caching strategy, since only you know the headers, this is fairly secure.",
          link: "http://junkdrawer.herokuapp.com/api_slug#secure"
        }
    else
      if !params[:headers]
        render json: {
            message: "This endpoint requires a headers array.",
            link: "http://junkdrawer.herokuapp.com/api_slug#secure"
          }
      else
        # take the headers and deal with them.
        # render json APICache.get(params[:endpoint])
        render json: {
            message: "This is not actually implemented! Please help me write the code!",
            link: "http://github.com/blairanderson/junkdrawer/tree/master/app/controllers/api_slug_controller.rb"
          }
      end
    end
  end
end

