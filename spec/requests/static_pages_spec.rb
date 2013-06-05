require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end

    it "should have a home title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => 'Home')
    end
  end

  describe "Help page" do
    it "should have a help page" do
      visit '/static_pages/help'
      page.should have_content('Help Page')
    end

    it "should have a help title" do 
      visit '/static_pages/help'
      page.should have_selector('title', :text => "Help")
    end
  end

  describe "About page" do
    it "should be a about page" do
      visit "/static_pages/about"
      page.should have_content('About Page')
    end

    it "should be a fuck title" do
      visit "/static_pages/about"
      page.should have_selector('title', :text => "FUCK")
    end
  end
end