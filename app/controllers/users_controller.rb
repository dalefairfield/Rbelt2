class UsersController < ApplicationController
  def new
  end

  def create
    @new = User.new(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation])
    if @new.save
      # render 'new'
      session[:user_id]=@new.id
      session[:first_name]=@new.first_name
      redirect_to '/groups/index'
    else
      flash[:message]= "Invalid register"
      redirect_to '/users/new'
    end
  end
  def login
    user= User.find_by_email(params[:email])
    if user == nil
      flash[:message]= ["Invalid Email"]
      flash[:message].append("Invalid")
      redirect_to '/users/new'
    else
      if user.authenticate(params[:password])
        session[:user_id]=user.id
        session[:first_name]=user.first_name
        session[:last_name]=user.last_name
        redirect_to '/groups/index'
      else
        flash[:message]="Invalid password"
        flash[:message].append("Invalid")
        redirect_to '/users/new'
      end
    end
  end
  def logout
    reset_session
    redirect_to '/users/new'
  end

end
