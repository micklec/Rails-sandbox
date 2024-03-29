require 'spec_helper'

describe "User pages" do
  
  subject { page }

  describe "index" do

    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      sign_in user
      visit users_path
    end

    it { should have_selector('title', text: 'All users') }
    it { should have_selector('h1',    text: 'All users') }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all)  { User.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each user" do
        User.paginate(page: 1).each do |user|
          page.should have_selector('li', text: user.name)
        end
      end
    end
  end
  
  describe "signup" do
    
    before { visit signup_path }
    it { should have_selector('h1',     text: 'Sign up') }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button "Create my account" }.not_to change(User, :count)
        # this is the same as -
        # initial = User.count
        # click_button "Create my account"
        # final = User.count
        # initial.should == final
      end
    end
    
    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "should create a user" do
        expect { click_button "Create my account" }.to change(User, :count).by(1)
      end
      describe "after saving the user" do
        before { click_button "Create my account"}
        let(:user) { User.find_by_email('user@example.com') }
        it { should have_selector('section', text: user.name) }
        it { should have_selector('div', text: 'Thanks for signing up!') }
        it { should have_link('Sign out') }
      end
    end

    describe "error messages" do
      before { click_button "Create my account" }
      let (:error_text) { 'This form contains' }
      it { should have_selector('title', tet: 'Create my account')}
      it { should have_content(error_text) }
    end
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    
    it { should have_selector('h1',     text: user.name) }
    it { should have_selector('title',  text: user.name) }
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_selector('h1',    text: "Update your profile") }
      it { should have_selector('title', text: "Edit user") }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      let(:error) { 'This form contains 1 error' }
      before { click_button "Save changes" }

      it { should have_content(:error) }
    end
    
    describe "with valid information" do
      let(:user)      { FactoryGirl.create(:user) }
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      
      before do
        fill_in "Name",         with: new_name
        fill_in "Email",        with: new_email
        fill_in "Password",     with: user.password
        fill_in "Confirmation", with: user.password
        click_button "Save changes"
      end

      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { user.reload.name.should  == new_name }  # => See below
      specify { user.reload.email.should == new_email }
    end

  end

end


# => RELOAD: This code reloads the user variable from the test database 
# => using user.reload, and then verifies that the user’s new name 
# => and email match the new values.