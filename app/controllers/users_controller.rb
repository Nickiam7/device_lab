class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]

	def show
		@user = User.find(params[:id])
		@q = current_user.links.search(params[:q])
		@links = @q.result.paginate(page: params[:page], per_page: 10)
		@brands = Brand.all
	end

	def admin
		@users = User.all
		@links = Link.paginate(page: params[:page], per_page: 5)
		@brands = Brand.all
	end
end


