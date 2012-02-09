require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
     it { should have_selector('h1',     text: heading) }
     it { should have_selector('title',  text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)     { 'Home'}
    let(:page_title)  { 'Home'}
    it_should_behave_like "all static pages"
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)     { 'Help'}
    let(:page_title)  { 'Help'}
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)     { 'About'}
    let(:page_title)  { 'About us'}
    it_should_behave_like "all static pages"
    
    it { should have_content('about us') }
  end

  describe "Contact page" do    # => Leaving as basic for comparison
    before { visit contact_path }
    it { should have_selector('h1',     text: 'Contact') }
    it { should have_selector('title',  text: full_title('Contact us')) }
    it { should have_content('contact us') }
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact us')
    click_link "Home"
    page.should have_selector 'title', text: full_title('Home')
    click_link "Sign up"
    page.should have_selector 'title', text: full_title('Sign up')
  end

end
