# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before do
   @user = User.new(
		   	name:"helix", 
		   	email:"i@verfino.com", 
		   	password:"123456", 
		   	password_confirmation:"123456")
  end

  it "should be have name, email and password_digest so on.." do
    @user.should respond_to(:name)
    @user.should respond_to(:email)
    @user.should respond_to(:password_digest)
    @user.should respond_to(:password)
    @user.should respond_to(:password_confirmation)
    @user.should be_valid
  end

  subject { @user }

##############################
## valud can not be blank
##############################

  describe "name can not be blank" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end

  describe "email can not be blank" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end

  describe "password can not be blank" do
  	before { @user.password = " " }
  	it { should_not be_valid }
  end

  describe "password_confirmation can not be blank" do
  	before { @user.password_confirmation = " " }
  	it { should_not be_valid }
  end

##############################
## valud should be uniqueness
##############################

  describe "email should be uniqueness" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

##############################
## valud other format
##############################

  describe "name can not too long" do
    before { @user.name = "a"*100 }
    it { should_not be_valid }
  end

  describe "with a password that's too short less than 6 size" do
	  before { @user.password = @user.password_confirmation = "a" * 5 }
	  it { should be_invalid }
	end

  describe "email should have right format" do
    before { @user.email = "xxxxxx@gmailxx.com" }
    it { should be_valid }
  end

  describe "password should match" do
  	before { @user.password_confirmation = "mismatch" }
  	it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end