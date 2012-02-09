require 'spec_helper'

describe "StaticPages" do
  
  base_title = "Ruby on Rails Sample App"
  
  describe "GET /static_pages" do
    
    describe "Home page" do
      
      it "should have the right title" do
        visit root_path
        page.should have_selector('title', text: "#{base_title} | Home")
      end
      
      it "should have the content 'Sample App'" do
        visit root_path
        page.should have_content('Sample App')
      end
    end
    
    describe "Help page" do
      
      it "should have the right title" do
        visit help_path
        page.should have_selector('title', text: "#{base_title} | Help")
      end

      it "should have the content 'Help'" do
        visit help_path
        page.should have_content('Help')
      end
    end
  
    describe "About page" do
      
      it "should have the right title" do
        visit about_path
        page.should have_selector('title', text: "#{base_title} | About")
      end

      it "should have the content 'about us'" do
        visit about_path
        page.should have_content('about us')
      end
    end
    
    describe "Contact page" do

      it "should have the title 'Contact'" do
        visit contact_path
        page.should have_selector('title',
                          text: "#{base_title} | Contact")
      end

      it "should have the content 'contact us'" do
        visit contact_path
        page.should have_content('contact us')
      end

      it "should have the h1 'Contact'" do
        visit contact_path
        page.should have_selector('h1', text: 'Contact')
      end
    end

  end
end
