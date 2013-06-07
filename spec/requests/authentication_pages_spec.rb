require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }

  describe "sign in page" do
  	before { visit sign_in_path }
  	it { should have_selector('h1',    text: 'Sign in') }
  	it { should have_selector('title', text: 'Sign in')}
  end

end
