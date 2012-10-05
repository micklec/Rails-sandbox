class StaticPagesController < ApplicationController

	before_filter :signed_in_user,  only: [:sandbox]

	def home
	end

	def help
	end

	def about 
	end

	def sandbox
		@items = [[1,2,3,4], [5,6,3], [3,4,5,6,7,4]]
	end
    
	private

		def signed_in_user
		  unless signed_in?
		    redirect_to signin_url, notice: "Please sign in to access this page." 
		  end
		end

end
