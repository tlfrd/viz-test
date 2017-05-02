module AuthHelper
  def http_login
    user = ENV["APP_USER"]
    pw = ENV["APP_SECRET"]
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end
end
