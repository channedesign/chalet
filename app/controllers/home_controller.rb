class HomeController < ApplicationController

	def index
		@prices = PriceListing.all
		@prices2 = PriceListingTwo.all
	end

end
