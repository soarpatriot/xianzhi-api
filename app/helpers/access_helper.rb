require 'rest-client'
module AccessHelper

  def token_authenticate!
    error!("4010", 401) if params[:auth_token].nil?
    error!('4014', 401) unless current_user
  end

  def current_user
    @current_user ||= AuthToken.where(value: params[:auth_token]).first.try(:user)
  end
  
  
  def access_token url, data={}
    response = RestClient.get url, data
    JSON.parse response, symbolize_names: true
  end

end
