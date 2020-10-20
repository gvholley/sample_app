class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items current_user.feed.paginate(page: params[:page])
    end
  end

  def destroy
  end

  private

  def microposts_params
    params.reuire(:micropost).permit(:content)
  end
end