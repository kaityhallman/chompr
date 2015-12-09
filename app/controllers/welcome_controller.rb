class WelcomeController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end


  def index
  	@users = User.all
  end

	def upvote 
	  @user = User.find(params[:id])
	  @user.upvote_by current_user
	  redirect_to :back
	end  

	def downvote
	  @user = User.find(params[:id])
	  @user.downvote_by current_user
	  redirect_to :back
	end

end
