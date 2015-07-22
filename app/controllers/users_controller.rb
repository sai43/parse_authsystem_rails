class UsersController < ApplicationController

 before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/new
  def new  
    @user = User.new  
  end  

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end


  def create  
    @user = User.new(params[:user])  
    session[:user_id] = @user.objectId  
    # Rails.logger.info "User: #{@user.inspect}"

    if @user.save  
      redirect_to root_url, notice: 'User was successfully created.'
     #redirect_to root_url, :notice => "Signed up!"  
     #Rails.logger.info "Saved User info : #{@user.inspect}"
    else  
      render "new"  
    end  
  end


  # GET /users/1
  # GET /users/1.json
  def show
    Rails.logger.info "Show User: #{@user.inspect}"
  end

  # GET /users/1/edit
  def edit
  end

  # # POST /users
  # # POST /users.json
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: 'User was successfully created.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  def update
    if @user.update(params[:user])
        redirect_to @user, notice: 'User was successfully updated.'
    else
        render :edit
    end

    # respond_to do |format|
    #   if @user.update(params[:user])
    #     redirect_to @user, notice: 'User was successfully updated.'
    #     # format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     # format.json { render :show, status: :ok, location: @user }
    #   else
    #     render :edit
    #     # format.html { render :edit }
    #     # format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # # DELETE /users/1
  # # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to root_url, notice: 'User was successfully destroyed.'
    # respond_to do |format|
    #   format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      #@user = User.find(params[:id])
      @user =  User.where(:objectId => params[:id]).first

    end


end
