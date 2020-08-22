class ConvertersController < ApplicationController
  REQUIRED_PARAMS = [
    {name: :url, type: :url, description: "fetch data from this url", example: "https://www.google.com/sitemap.xml"},
    {name: :to, type: :datatype, description: "convert to this data type", example: "json"}
  ]
  VALID_OUTPUT = [:json]

  before_action :required_params, only: [:xml]

  def index
    success_api_response({
      converters: [{id: "xml",type: "xml",action: "POST",path: xml_converters_path,required_params: REQUIRED_PARAMS,example: "[POST] => /converters/xml?to=json&url=https%3A//www.example.com/feed",}]
    })
  end

  def xml
    data = XmlCache.get(params[:url])
    if json = XmlCache.xml_to_json(data)
      success_api_response({data: json})
    else
      error_api_response("could not convert XML from #{params[:url]}. Make sure it is XML")
    end
  end

  def required_params
    REQUIRED_PARAMS.each {|prop| params.fetch(prop[:name]) }

    unless params[:to].to_sym.in?(VALID_OUTPUT)
      raise "#{params[:to]} is not valid output"
    end
  end

end
