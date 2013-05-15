class TutorialsController < ApplicationController
	def new
		@tutorial = Tutorial.new
	end
	def create
		@tutorial = Tutorial.new(params[:tutorial])
		if @tutorial.save
			flash[:notice] = "Your Tutorial is ready to be created"
			redirect_to new_tutorial_step_path(@tutorial)
		else
			flash[:notice] = "Please, make sure all your fields are filled out correctly"
			render :action => "new"
		end
	end
end
