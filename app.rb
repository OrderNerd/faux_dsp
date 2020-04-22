require "sinatra"
require "sinatra/custom_logger"
require "sinatra/jsonp"
require "logger"

set :logger, Logger.new(STDOUT)

post "/location_verify" do
  payload = JSON.parse(request.body.read)
  logger.info("location_verify payload=#{payload}")
  if(payload["phone"] == "1")
    status 400
    jsonp(authorized: false)
  else
    status 204
  end
end

post "/location_created" do
  payload = JSON.parse(request.body.read)
  logger.info("location_created payload=#{payload}")
  status 204
end

post "/order_confirmed" do
  payload = JSON.parse(request.body.read)
  logger.info("order_confirmed payload=#{payload}")
  status 204
end
