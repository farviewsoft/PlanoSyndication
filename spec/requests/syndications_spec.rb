require 'rails_helper'

RSpec.describe "Syndications", type: :request do
	before(:all) do
		Syndication.create(name: 'tour_urls.txt', body: "Old Feed")
		sleep(1)
		Syndication.create(name: 'tour_urls.txt', body: "
		  poc_wpm|3319723|http://www.planomatic.com/17722\n
		  poc_wpm|3319784|http://www.planomatic.com/18796
		")

		Syndication.create(name: 'tour_slides_descriptions.txt', body: "Old Feed")
		sleep(1)
		Syndication.create(name: 'tour_slides_descriptions.txt', body: "
		  poc_wpm|3319723|0|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/607664.jpg|Stately Home\n
		  poc_wpm|3319723|1|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605845.jpg|2-Story Entry\n
		  poc_wpm|3319723|2|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605843.jpg|Living Room with Fireplace\n
		  poc_wpm|3319723|3|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605851.jpg|Formal Dining Room\n
		  poc_wpm|3319723|4|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605844.jpg|Kitchen with Center Island\n
		  poc_wpm|3319723|5|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605849.jpg|Breakfast Room \n
		  poc_wpm|3319723|6|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605850.jpg|Family Room off Kitchen\n
		  poc_wpm|3319723|7|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605846.jpg|Office with Fireplace\n
		  poc_wpm|3319723|8|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605847.jpg|1st Floor Bedroom\n
		  poc_wpm|3319723|9|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605855.jpg|Master Bedroom\n
		  poc_wpm|3319723|10|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605856.jpg|Master Bedroom Sitting Room\n
		  poc_wpm|3319723|11|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605852.jpg|Master Bath\n
		  poc_wpm|3319723|12|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605853.jpg|Bedroom\n
		  poc_wpm|3319723|13|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605858.jpg|Bedroom\n
		  poc_wpm|3319723|14|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605854.jpg|Bedroom\n
		  poc_wpm|3319723|15|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605859.jpg|Bedroom\n
		  poc_wpm|3319723|16|http://photoplan-cache.planomatic.com/tourFiles/17722/photocache/605857.jpg|Rear View\n
		  poc_wpm|3319784|0|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642046.jpg|Front View of Property\n
		  poc_wpm|3319784|1|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642037.jpg|Living Room\n
		  poc_wpm|3319784|2|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642045.jpg|Formal Dining Room\n
		  poc_wpm|3319784|3|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642018.jpg|Renovated Eat-in-Kitchen\n
		  poc_wpm|3319784|4|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642023.jpg|Another View of Kitchen\n
		  poc_wpm|3319784|5|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642044.jpg|Breakfast Area\n
		  poc_wpm|3319784|6|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642034.jpg|Family Room\n
		  poc_wpm|3319784|7|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642029.jpg|Heated Enclosed Porch\n
		  poc_wpm|3319784|8|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642020.jpg|Master Bedroom\n
		  poc_wpm|3319784|9|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642021.jpg|Another View of Master Bedroom\n
		  poc_wpm|3319784|10|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642019.jpg|Renovated Bath\n
		  poc_wpm|3319784|11|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642022.jpg|Office/Bedroom\n
		  poc_wpm|3319784|12|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642032.jpg|Rearview\n
		  poc_wpm|3319784|13|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642033.jpg|Fenced Backyard\n
		  poc_wpm|3319784|14|http://photoplan-cache.planomatic.com/tourFiles/18796/photocache/642028.jpg|Another Front View
		")
	end

  describe "GET" do
    it "returns 404" do
      get '/syndications/sometext.txt'
      expect(response).to have_http_status(404)
    end

    it "returns couple of Tour Urls" do
      get '/syndications/tour_urls.txt'
      expect(response).to have_http_status(200)
      expect(response.body).to include('poc_wpm|3319723|http://www.planomatic.com/17722')
    end

    it "returns couple of Tour Urls" do
      get '/syndications/tour_slides_descriptions.txt'
      expect(response).to have_http_status(200)
      expect(response.body).to include('poc_wpm|3319784')
    end

    it "loads the response Content-Type as 'plain/text'" do
    	get '/syndications/tour_slides_descriptions.txt'
    	expect(response.headers['Content-Type'] == 'text/plain')
    end
  end
end
