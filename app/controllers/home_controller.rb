class HomeController < ApplicationController
  http_basic_authenticate_with name: ENV["APP_USER"], password: ENV["APP_SECRET"]
  def index
  end
end
