class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about 
  end

  def sandbox
  	@items = [[1,2,3,4], [5,6,3], [3,4,5,6,7,4]]
  end
    
end
