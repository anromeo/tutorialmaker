require 'spec_helper'

feature do
	scenario "Create how to list" do
		visit '/'
		click_link '+ Tutorial'
		fill_in 'title', :with => "Title"
		fill_in 'description', :with => "Short Summary"
		click_button 'Create'
		page.should have_content("Your Tutorial is ready to be created")
		page.should have_content("+ Steps")
	end
end