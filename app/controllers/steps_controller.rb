class StepsController < ApplicationController

	before_filter :find_tutorial
	before_filter :find_step, :only => [:show, :edit, :update, :destroy]

	def new
		@step = @tutorial.steps.build
	end

	def edit
	end

	def create
		@step = @tutorial.steps.build(params[:step])
		if @step.save
			flash[:notice] = "Your step has been added."
			redirect_to @tutorial
		else
			flash[:notice] = "Your step has not been added."
			render :action => "new"
		end
	end

	private

	def find_tutorial
		@tutorial = Tutorial.find(params[:tutorial_id])
	end

	def find_step
		@step = @tutorial.steps.find(params[:id])
	end
end
