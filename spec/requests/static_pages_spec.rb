require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages" do
    
    describe "Home page" do
      
      it "should have the right title" do
        visit '/static_pages/home'
        page.should have_selector('title',
                          :text => "Ruby on Rails Sample App | Home")
      end
      
      it "should have the content 'Sample App'" do
        visit '/static_pages/home'
        page.should have_content('Sample App')
      end
    end
    
    describe "Help page" do
      
      it "should have the right title" do
        visit '/static_pages/help'
        page.should have_selector('title',
                          :text => "Ruby on Rails Sample App | Help")
      end

      it "should have the content 'Help'" do
        visit '/static_pages/help'
        page.should have_content('Help')
      end
    end
  
    describe "About page" do
      
      it "should have the right title" do
        visit '/static_pages/about'
        page.should have_selector('title',
                          :text => "Ruby on Rails Sample App | About")
      end

      it "should have the content 'about us'" do
        visit '/static_pages/about'
        page.should have_content('about us')
      end
    end

  end
end
