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
		   	email:"i@verfino.com")
  end

  it "should be have name, email and password_digest so on.." do
    @user.should respond_to(:name)
    @user.should respond_to(:email)
    # @user.should respond_to(:password_digest)
    # @user.should respond_to(:password)
    # @user.should respond_to(:password_confirmation)
  end

  it "name and email should not null" do
    @user.should be_valid
  end

  subject { @user }

  describe "email and should be not valid" do
  	before { @user.email = " ", @user.name = " " }
  	it { should_not be_valid }
    it { should_not be_valid }
  end

  describe "name can not too long" do
    before { @user.name = "a"*100 }
    it { should_not be_valid }
  end

  describe "email should have right format" do
    before { @user.email = "xxxxxx@gmailxx.com.cn" }
    it { should be_valid }
  end

  describe "email should be onece!" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

end