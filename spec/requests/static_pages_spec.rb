require 'spec_helper'

describe "Static pages \'s" do

  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit sp_home_path
      page.should have_content('Sample App')
    end

    it "should have a home title" do
      visit sp_home_path
      page.should have_selector('title', :text => 'Home')
    end
  end

  describe "Help page" do
    it "should have a help page" do
      visit sp_help_path
      page.should have_content('Help Page')
    end

    it "should have a help title" do 
      visit sp_help_path
      page.should have_selector('title', :text => "Help")
    end
  end

  describe "About page" do
    it "should be a about page" do
      visit sp_about_path
      page.should have_content('About Page')
    end

    it "should be a fuck title" do
      visit sp_about_path
      page.should have_selector('title', :text => "FUCK")
    end
  end

  describe "Content page" do
    it "should be a content page" do
      visit sp_content_path
      page.should have_content('Content Page')
    end

    it "should have a content title" do
      visit sp_content_path
      page.should have_selector('title', :text => "Content")
    end
  end
end