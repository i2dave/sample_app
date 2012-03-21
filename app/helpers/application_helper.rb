module ApplicationHelper
	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
	
	#Image link for the logo
	def logo(the_image_url, the_alt, the_class="round")
		image_tag(the_image_url, alt: the_alt, class: the_class)
	end
end
