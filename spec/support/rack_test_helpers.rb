require "rack/test"

module RackTestHelpers
  def app
    ServiceApplication
  end

  def current_user
    @user ||= create :user
  end

  def current_token
    @token ||= AuthToken.create user: current_user
  end

  def json_post url, data={}
    post url, data
    JSON.parse last_response.body, symbolize_names: true
  end

  def json_get url, data={}
    get url, data
    JSON.parse last_response.body, symbolize_names: true
  end

  def auth_json_get url, data={}
    get url, data.merge(auth_token: current_token.value)
    JSON.parse last_response.body, symbolize_names: true
  end

  def auth_json_post url, data={}
    post url, data.merge(auth_token: current_token.value)
    JSON.parse last_response.body, symbolize_names: true
  end

  def auth_data_post url, data={}
    token_hash = {auth_token:current_token.val}
    post url, token_hash.merge(data)
    p last_response.body
    p last_response.headers
    JSON.parse last_response.body, symbolize_names: true
  end

  def data_post url, data={}
    
    post url, data
    
    last_response
  end

  def data_get url, data={}
    get url, data
    last_response
  end



  def auth_json_put url, data={}
    put url, data.merge(auth_token: current_token.value)
    JSON.parse last_response.body, symbolize_names: true
  end

  def data_delete url, data={}
    delete url, data 
    last_response
  end

  def auth_json_delete url, data={}
    delete url, data.merge(auth_token: current_token.value)
    JSON.parse last_response.body, symbolize_names: true
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include RackTestHelpers
end
