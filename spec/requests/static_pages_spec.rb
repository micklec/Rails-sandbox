require 'spec_helper'

describe "StaticPages" do
  
  let(:base_title) {"Ruby on Rails Sample App"}
  
  describe "GET /static_pages" do
    
    describe "Home page" do
      
      it "should have the right title" do
        visit '/static_pages/home'
        page.should have_selector('title', :text => "#{:base_title} | Home")
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
                          :text => "#{:base_title} | Help")
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
                          :text => "#{:base_title} | About")
      end

      it "should have the content 'about us'" do
        visit '/static_pages/about'
        page.should have_content('about us')
      end
    end
    
    describe "Contact page" do

      it "should have the right title" do
        visit '/static_pages/contact'
        page.should have_selector('title',
                          :text => "#{:base_title} | Contact")
      end

      it "should have the content 'contact us'" do
        visit '/static_pages/contact'
        page.should have_content('contact us')
      end
    end

  end
end
