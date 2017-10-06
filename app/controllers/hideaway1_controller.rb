class Hideaway1Controller < ApplicationController
  def index
    @chalet = House.where(name: 'Chalet Hideaway I').take
    @floor_plans = @chalet.floor_plans.where(name: 'English')
    @other_chalets = House.where.not(name: 'Chalet Hideaway I').order(:position)
  end
end
