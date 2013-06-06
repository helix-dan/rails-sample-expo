require 'spec_helper'

describe "User Page \'s" do 

  describe "" do
  	before { visit new_user_path }
  	it "should have a sign page" do
  	  page.should have_selector('h1', text: 'Sign up')
  	end

  	it "should have a sign up title" do
  	  page.should have_selector('title', text: 'Sign up')
    end
  end

end