require 'spec_helper'

describe "Static pages \'s" do

  describe "Home page" do
  	before { visit sp_home_path }
    it "should have the content 'Helix Dan App'" do
      page.should have_content('Helix Dan\'s App')
    end

    it "should have a home title" do
      page.should have_selector('title', :text => 'Home')
    end
  end

  describe "Help page" do
  	before { visit sp_help_path }
    it "should have a help page" do
      page.should have_content('Help Page')
    end

    it "should have a help title" do
      page.should have_selector('title', :text => "Help")
    end
  end

  describe "About page" do
  	before { visit sp_about_path }
    it "should be a about page" do
      page.should have_content('About Page')
    end

    it "should be a fuck title" do
      page.should have_selector('title', :text => "FUCK")
    end
  end

  describe "Content page" do
  	before { visit sp_content_path }
    it "should be a content page" do
      page.should have_content('Content Page')
    end

    it "should have a content title" do
      page.should have_selector('title', :text => "Content")
    end
  end
end