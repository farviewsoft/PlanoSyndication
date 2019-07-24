class SyndicationController < ApplicationController
  def tour_urls
	response = Syndication.last_feed("tour_urls.txt")
  	send_data response,
    		:type => 'text/plain; charset=UTF-8;',
    		:disposition => "attachment; filename=tour_urls.txt"
  end

  def tour_slides_descriptions
  	response = Syndication.last_feed("tour_slides_descriptions.txt")
    	render({plain: response})
  end
end
