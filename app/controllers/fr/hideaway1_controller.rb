class Fr::Hideaway1Controller < ApplicationController
  layout 'french'
  def index
    @chalet = House.where(name: 'Chalet Hideaway I').take
    @floor_plans = @chalet.floor_plans.where(name: 'French')
    @other_chalets = House.where.not(name: 'Chalet Hideaway I').order(:position)
  end
end
