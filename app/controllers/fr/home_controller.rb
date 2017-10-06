class Fr::HomeController < ApplicationController
  layout 'french'
  def index
    @chalets = House.order(:position)
    
  end
end
