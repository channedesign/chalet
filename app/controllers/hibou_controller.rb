class HibouController < ApplicationController
  def index
    @chalet = House.where(name: 'Hibou').take
    @floor_plans = @chalet.floor_plans
    @other_chalets = House.where.not(name: 'Hibou').order(:position)
  end
end
