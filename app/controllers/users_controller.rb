class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]

	def show
		@user = User.find(params[:id])
		@links = current_user.links.paginate(page: params[:page], per_page: 10)
		@brands = Brand.all
	end
end
