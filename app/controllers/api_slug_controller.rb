class ApiSlugController < ApplicationController
  REQUIRED_PARAMS = [:endpoint]
  before_action :required_params, only: [:show, :cache]

  def index
    if current_user
      slugs = ApiSlug.where(user_id: current_user.id)
    else
      slugs = "Create an account to receive webhooks when urls update."
    end
    
    description = {
      title: "An API Cache",
      description: "I was inspired by TenderLoveMaking to create an api cache",
      inspiration: [
        "https://twitter.com/tenderlove/status/588172118845718529",
        "https://twitter.com/tenderlove/status/588171747226161152"
      ],
      example: "http://junkdrawer.herokuapp.com/api_slug/blairanderson-repos?endpoint=https://api.github.com/users/blairanderson/repos.json",
      slugs: slugs
    }
    success_api_response(description.merge({slugs: slugs}))
  end

  def show
    if params[:endpoint].present?
      url = params.delete(:endpoint)
      endpoint_params = params.except(:action, :controller, :id, :endpoint)
      render json: ApiCache.get("#{url}?#{endpoint_params.to_param}")
    else
      error_api_response("could not fetch #{params[:endpoint]}")
    end
  end

  def cache
    if params[:endpoint].present?
      url = params.delete(:endpoint)
      endpoint_params = params.except(:action, :controller, :id, :endpoint)
      render json: ApiCache.get("#{url}?#{endpoint_params.to_param}")
    else
      error_api_response("could not fetch #{params[:endpoint]}")
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
