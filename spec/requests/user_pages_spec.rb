require 'spec_helper'

describe "User Page \'s" do 

	subject { page }

  describe "should have a sign page and title" do
  	before { visit new_user_path }
  	it { should have_selector('h1',    text: 'Sign up') }
		it { should have_selector('title', text: 'Sign up') }
  end

  describe "user profile page should have" do
  	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }
  	it { should have_selector('title', text: user.name) }
  	it { should have_selector('h1',    text: user.name) }
  end

  describe "signup" do
    before { visit new_user_path }
    let(:submit) { "create my account" }

    describe "with valid information" do
      before do
        fill_in "name",         with: "Example User"
        fill_in "email",        with: "user@example.com"
        fill_in "password",     with: "foobar"
        fill_in "confirmation", with: "foobar"
      end
    end
    
  end

end