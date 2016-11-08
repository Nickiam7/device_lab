class LinksController < ApplicationController

	def index
		@links = Link.all
	end

	def new
		@link = current_user.links.new
	end

	def create
		@link = current_user.links.new(link_params)
		if @link.save
			flash[:success] = "Your link has been sent to the device lab."
			redirect_to user_path(current_user)	
		else
			render :new
		end
	end

	private

	def link_params
		params.require(:link).permit(:url, :title)
	end
end
