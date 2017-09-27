class HomeController < ApplicationController

	def index
		@chalets = House.order(:position)
		@chalet1 = House.first
		@chalet2 = House.last
		@prices = PriceListing.all
		@prices2 = PriceListingTwo.all
	end

end
