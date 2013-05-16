class StepsController < ApplicationController

	before_filter :find_tutorial
	before_filter :find_step, :only => [:show, :edit, :update, :destroy]

	def new
		@step = @tutorial.steps.build
    respond_to do |format|
      format.html
      format.json {render json: @links}
    end
	end

	def edit
		@step = @tutorial.steps.find(params[:id])
	end

	def update
		if @step.update_attributes(params[:step])
			flash[:notice] = "Step has been updated."
			redirect_to @tutorial
		else
			flash[:alert] = "Step has not been updated."
			render :action => "edit"
		end
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
