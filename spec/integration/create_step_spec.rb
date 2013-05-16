require 'spec_helper'

feature do
	before do
		visit '/'
		click_link '+ Tutorial'
		fill_in 'title', :with => "Title"
		fill_in 'description', :with => "Short Summary"
		click_button 'Create'
	end

	scenario "Create Steps" do
		click_link '+ Steps'
		fill_in 'description', :with => "This is how you do it"
		click_button 'Create'
		page.should have_content('Your step has been added')
	end
end