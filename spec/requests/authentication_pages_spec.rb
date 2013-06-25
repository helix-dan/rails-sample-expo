require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }	

  describe "sign in page" do
  	before { visit sign_in_path}

  	it { should have_selector('h1',    text:'Sign in')}
  	it { should have_selector('title', text:'Sign in')}
  	it { should have_selector('div.alert.alert-error', text: 'Invalid')}

  	describe "sign in success" do
	  	let(:user) { FactoryGirl.create(:user) }
	  	before do
	  		fill_in "Email",    with: user.email 
	  		fill_in "Password", with: user.password
	  		click_button "Sign in"
	  	end

	  	it { should have_selector('title',   text: user.name) }
	  	it { should have_link('Profile',     href: user_path(user))}
	  	it { should have_link('Sign out',    href: sign_out_path)}
	  	it { should_not have_link('Sign in', href: sign_in_path)}

	  end


  end

end
