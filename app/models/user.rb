class User < ParseUser
	alias :email :username
	
	fields :username, :password

   def self.authenticate(username, password)

      base_uri   = "https://api.parse.com/1/login"
      app_id     = settings['app_id']
      master_key = settings['master_key']

      Rails.logger.info "#{username} - #{password} - #{app_id} - #{master_key}"

      resource = RestClient::Resource.new(base_uri, app_id, master_key)
    
    begin
      resp = resource.get(:params => {:username => username, :password => password})
      user = model_name.to_s.constantize.new(JSON.parse(resp), false)
            
      user 
    rescue 
      false
    end

   end


end
