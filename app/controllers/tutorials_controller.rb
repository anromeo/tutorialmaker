class TutorialsController < ApplicationController
	def new
		@tutorial = Tutorial.new
	end

	def show
		@tutorial = Tutorial.find(params[:id])
	end

	def create
		@tutorial = Tutorial.new(params[:tutorial])
		if @tutorial.save
			flash[:notice] = "Your Tutorial is ready to be created"
			redirect_to @tutorial
		else
			flash[:notice] = "Please, make sure all your fields are filled out correctly"
			render :action => "new"
		end
	end

end
