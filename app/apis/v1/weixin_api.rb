class V1::WeixinApi < Grape::API

  resources :weixin do

    desc "返回 token", {
    }
    params do
      requires :signature,type:String, desc: "签名"
      requires :timestamp,type:String, desc: "时间戳"
      requires :nonce,type:String, desc: "nonce"
      requires :echostr,type:String, desc: "echostr"
    end
    get do
      env['api.format'] = :txt
      temp_arr = []
      token = "weixinSongXianZhi"
      timestamp = params[:timestamp]
      nonce = params[:nonce]
      echostr = params[:echostr] 

      temp_arr =[ token, timestamp,nonce]
      temp_str = temp_arr.sort.join() 
      dig = Digest::SHA1.hexdigest(temp_str)
      if dig == params[:signature]
        
      end
      echostr.to_s
    end

  end
end
