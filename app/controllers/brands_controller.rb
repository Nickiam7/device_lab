class BrandsController < ApplicationController
	before_action :authenticate_user!

	def index
		@brands = Brand.all
	end

	def new
		@brand = Brand.new
	end

	def create
		@brand = Brand.new(brand_params)
		if @brand.save
			flash[:success] = "#{@brand.full_name} has been added."
			redirect_to brands_path
		else
			flash[:alert] = "Something went wrong."
			render :new
		end
	end

	def edit
		@brand = Brand.find(params[:id])
	end

	def update
		@brand = Brand.find(params[:id])
		if @brand.update_attributes(brand_params)
			flash[:success] = "#{@brand.full_name} has been updated."
			redirect_to brands_path
		else
			flash[:alert] = "Something went wrong."
			render :edit
		end
	end

	def destroy
		@brand = Brand.find(params[:id])
		if @brand.destroy
			flash[:success] = "#{@brand.full_name} was has been deleted."
			redirect_to brands_path
		else
			flash[:alert] = "Something went wrong."
			redirect_to brands_path
		end
	end

	private

	def brand_params
		params.require(:brand).permit(:name, :full_name)
	end
end
