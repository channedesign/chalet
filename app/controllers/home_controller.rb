class HomeController < ApplicationController

	def index
		@chalet1_appartments = House.first.appartments
		@chalet2_appartments = House.last.appartments
		@prices = PriceListing.all
		@prices2 = PriceListingTwo.all
	end

end
