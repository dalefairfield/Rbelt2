class GroupsController < ApplicationController
  def index
    @groups=Group.all
    @members=Member.all
  end

  def new
  end

  def create
    # print "?????????????????????????????????"
    # print session[:user_id]
    # print "?????????????????????????????????"
    @newgroup=Group.create(name:params[:name], description:params[:description], user_id:session[:user_id])
    if @newgroup.errors.any?
      flash[:message]= "No field can be left blank"
      redirect_to '/groups/index'
    else
      redirect_to '/groups/index'
    end
  end

  def show
    @show= Group.find(params[:id])
    @join=Member.where(group_id:params[:id])
    render 'show'
  end

  def destroy
    @groupdelete= Group.find(params[:id])
    @groupdelete.destroy
    redirect_to '/groups/index'
  end
end
