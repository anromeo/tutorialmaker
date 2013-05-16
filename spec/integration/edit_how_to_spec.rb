require 'spec_helper'

feature do

	before do
		visit '/'
		click_link '+ Tutorial'
		fill_in 'title', :with => "This Title"
		fill_in 'description', :with => "Short Summary"
		click_button 'Create'
	end

	scenario "Edit tutorial" do
		visit '/'
		click_link "This Title"
		click_link "Edit Tutorial"
		fill_in 'title', :with => "New Title"
		fill_in 'description', :with => "Different Information"
		click_button 'Edit'
		page.should have_content("New Title")
		page.should have_content("Different Information")
	end
end