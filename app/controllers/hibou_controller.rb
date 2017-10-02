class HibouController < ApplicationController
  def index
    @chalet = House.where(name: 'Hibou').take
    @other_chalets = House.where.not(name: 'Hibou').order(:position)
  end
end
