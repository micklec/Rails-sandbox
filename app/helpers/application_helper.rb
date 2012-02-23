module ApplicationHelper
  
  def logo
    image_tag("logo.png", alt: "Sample App", class: "round")
  end
  
  def full_title(page_title)        # => returns the full title on a per-page basis
    base_title = "Ruby on Rails Sample App"
    if page_title.empty? 
      base_title 
    else
     "#{base_title} | #{page_title}"
    end
  end

end
