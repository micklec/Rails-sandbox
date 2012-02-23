class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper 	# see below
end

# By default, helpers are available in the views but not 
# in the controllers. We need the methods from the Sessions helper 
# in both the view and the controllers, so we have to include
# it explicitly.
