class BrandsController < ApplicationController

	def new
		@brand = Brand.new
	end

	def create
		@brand = Brand.new(brand_params)
		if @brand.save
			flash[:success] = "New brand has been created."
			redirect_to new_brand_path
		else
			flash[:success] = "Something went wrong."
			render :new
		end
	end	

	private

	def brand_params
		params.require(:brand).permit(:name)
	end
end
