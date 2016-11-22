class MembersController < ApplicationController
  def create

    if not Member.where(user_id:session[:user_id], group_id: params[:group_id]).exists?
        @join=Member.create(user_id:session[:user_id], group_id:params[:group_id])
    else
      flash[:message]= "You have already joined this group!"
    end
    # @edit=BrightIdea.find(id:params[:id]))
    @edit=Group.where(id:params[:id])

    redirect_to :back
  end
  def destroy
    @leavegroup= User.find(params[:id])
    @leavegroup.destroy
    redirect_to :back
  end
end
