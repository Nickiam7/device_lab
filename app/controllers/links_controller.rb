class LinksController < ApplicationController

	def index
		@links = Link.all
	end

	def new
		@link = current_user.links.new
		@brands = Brand.all
	end

	def create
		@link = current_user.links.new(link_params)
		@brands = Brand.all
		if @link.save
			flash[:success] = "Your link has been sent to the device lab."
			redirect_to user_path(current_user)	
		else
			render :new
		end
	end

	def edit
		@link = Link.find(params[:id])
		@brands = Brand.all
	end

	def update
		@link = Link.find(params[:id])
		@brands = Brand.all
		if @link.update_attributes(link_params)
			flash[:success] = "#{@link.title} has been updated."
			redirect_to user_path(current_user)	
		else
			flash[:alert] = "Something went wrong."
			render :new
		end
	end

	def destroy
		@link = Link.find(params[:id])
		if @link.destroy
			flash[:success] = "#{@link.title} has been deleted."
		else
			flash[:alert] = "Something went wrong."
		end
		redirect_to user_path(current_user)
	end

	private

	def link_params
		params.require(:link).permit(:url, :title, :brand_id)
	end
end
