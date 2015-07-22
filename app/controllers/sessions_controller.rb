class SessionsController < ApplicationController

  def new  
  end  
    
  def create  
    user = User.authenticate(params[:username], params[:password])  
    # Rails.logger.info " Session User info: #{user.inspect}"
    if user  
       session[:user_id] = user.objectId  
       # Rails.logger.info "Session UserID: #{session[:user_id]}"
       redirect_to root_url, notice: 'Logged in  successfully'
       #redirect_to root_url, :notice => "Logged in!"  
    else  
      flash.now.alert = "Invalid email or password"  
      render "new"  
    end  

  end 

  def destroy  
  	session[:user_id] = nil  
  	redirect_to root_url, :notice => "Logged out!"  
  end 


end
