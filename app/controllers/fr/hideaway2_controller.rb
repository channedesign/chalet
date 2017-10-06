class Fr::Hideaway2Controller < ApplicationController
  layout 'french'
  def index
    @chalet = House.where(name: 'Chalet Hideaway II').take
    @floor_plans = @chalet.floor_plans.where(name: 'French')
    @other_chalets = House.where.not(name: 'Chalet Hideaway II').order(:position)
  end
end
