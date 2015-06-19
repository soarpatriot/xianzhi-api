require 'spec_helper'

describe AccessHelper, :type => :helper do
   
  include AccessHelper
  context "access_token" do 

    it "success" do
      url = "https://api.weixin.qq.com/cgi-bin/token" 
      grant_type = "client_credential"
      appid = "wx9120e6e8e725640e"
      secret = "f0b2e806a9ee45b9fbf3e09899178fb7"

      res = access_token full_url(url,grant_type, appid, secret )
     
      expect(res[:access_token]).not_to be_nil
      expect(res[:expires_in]).to be(7200)

    end
  end

  def full_url url,grant_type,appid,secret 
     "#{url}?grant_type=#{grant_type}&appid=#{appid}&secret=#{secret}"
  end

end
