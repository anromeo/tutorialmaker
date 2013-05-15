class StepsController < ApplicationController

	before_filter :find_tutorial
	before_filter :find_step, :only => [:show, :edit, :update, :destroy]

	def new
		@steps = @tutorial.steps.build
	end

	def edit
	end

	def create
	end

	private

	def find_tutorial
		@tutorial = Tutorial.find(params[:tutorial_id])
	end

	def find_step
		@step = @tutorial.steps.find(params[:id])
	end
end
