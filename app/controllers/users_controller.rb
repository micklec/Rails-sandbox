class UsersController < ApplicationController

  before_filter :signed_in_user,  only: [:edit, :update]
  before_filter :correct_user,    only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])   # => SEE BELOW for params notes
    if @user.save
      sign_in @user
      flash[:success] = "Thanks for signing up!"
      redirect_to @user
    else
      render 'new'
    end
  end

 # def edit
 #   @user = User.find(params[:id])   # => No longer need this with before_filter
 # end

  def update
   # @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = 'Profile updated'
      sign_in @user     # => Need to sign in again because remember_token
      redirect_to @user # => gets reset
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
    
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in." 
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
  
end


# the params hash contains information about each request.
# in the case of a URI like /users/1, the value of params[:id] is 
# the id of the corresponding user (1 in this example). 
#
# In the case of posting to the signup form, params instead contains a 
# hash of hashes. 
#
# Although the hash keys appear as strings in the debug output, 
# internally Rails uses symbols, so that params[:user] is the hash of 
# user attributes—in fact, exactly the attributes needed as 
# an argument to User.new. 
#
# This means that the line @user = User.new(params[:user])
# Is equivalent to
# @user = User.new(name: "Foo Bar", email: "foo@invalid",
#                  password: "dude", password_confirmation: "dude")



