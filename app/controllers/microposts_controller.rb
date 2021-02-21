class MicropostsController < ApplicationController
	def create
@micropost = current_user.microposts.build(micropost_params)
if @micropost.save
flash[:success] = "Micropost created!"
redirect_to current_user
else
render 'static_pages/home'
end
end
def homepost
	if logged_in?
@micropost = current_user.microposts.build
@feed_items = current_user.feed.paginate(page: params[:page])
end
end
def destroy
	@micropost.destroy
flash[:success] = "Micropost deleted"
redirect_to request.referrer || root_url
end
private
def micropost_params
params.require(:micropost).permit(:content)
end
end
