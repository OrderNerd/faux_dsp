require "sinatra"
require "sinatra/custom_logger"
require "sinatra/jsonp"
require "logger"

set :logger, Logger.new(STDOUT)

post "/account_verify" do
  payload = JSON.parse(request.body.read)
  logger.info("account_verify payload=#{payload}")
  if(payload["phone"] == "1")
    status 400
    jsonp(authorized: false)
  else
    status 204
  end
end

post "/account_created" do
  payload = JSON.parse(request.body.read)
  logger.info("account_created payload=#{payload}")
  status 204
end
