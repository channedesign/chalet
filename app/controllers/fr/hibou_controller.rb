class Fr::HibouController < ApplicationController
  layout 'french'
  def index
    @chalet = House.where(name: 'Hibou').take
    @other_chalets = House.where.not(name: 'Hibou').order(:position)
  end
end
