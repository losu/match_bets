#coding: UTF-8

class GroupsController < ApplicationController

	def show
		@group = Group.find(params[:id])
	end

	def new
		@group = Group.new
	end

	def create
		@group=Group.new(group_params)
		if @group.save
			redirect_to root_url, notice: 'Dodano grupę.'
		else
			render :new
		end
	end

		private
			def group_params
				params.require(:group).permit(:name)		
			end

end