require "sinatra"
require "sinatra/custom_logger"
require "sinatra/jsonp"
require "logger"

set :logger, Logger.new(STDOUT)

post "/account_verify" do
  payload = JSON.parse(request.body.read)
  logger.info("account_verify payload=#{payload}")
  status 202
  jsonp(authorized: true)
end

post "/account_create" do
end
