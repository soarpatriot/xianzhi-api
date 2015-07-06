require "spec_helper"

describe V1::WeixinApi do 
 
  let(:weixin_path) {"v1/weixin"} 
  context "weixin" do 
    it "token" do 
       token = "weixinSongXianZhi" 
       signature = "ssdhfasdjfasdf"
       timestamp = DateTime.now.to_i  
       nonce = "haha"
       echostr = "hello"

       res = data_get weixin_path,  timestamp: timestamp, nonce: nonce, echostr:echostr, signature:signature

       expect(res.body).to eq(echostr) 

    end
  end
end
