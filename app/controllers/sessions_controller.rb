class SessionsController < ApplicationController

  def new  
  end  
    
  def create  
    user = User.authenticate(params[:email], params[:password])  
    Rails.logger.info "User: #{user.inspect}"
    if user  
      session[:user_id] = user.objectId  
       Rails.logger.info "UserID: #{session[:user_id]}"
      redirect_to root_url, :notice => "Logged in!"  
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
