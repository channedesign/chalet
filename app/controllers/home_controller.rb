class HomeController < ApplicationController

	def index
		@chalet1 = House.first
		@chalet2 = House.last
		@prices = PriceListing.all
		@prices2 = PriceListingTwo.all
	end

end
