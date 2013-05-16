class TutorialsController < ApplicationController

	def new
		@tutorial = Tutorial.new
	end

	def edit
		@tutorial = Tutorial.find(params[:id])
	end

	def show
		@tutorial = Tutorial.find(params[:id])
	end

	def index
		@tutorials = Tutorial.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tutorials }
    end
	end

	def update
		@tutorial = Tutorial.find(params[:id])

    respond_to do |format|
      if @tutorial.update_attributes(params[:tutorial])
        format.html { redirect_to @tutorial, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
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
