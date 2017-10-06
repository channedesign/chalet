class Hideaway2Controller < ApplicationController
  def index
    @chalet = House.where(name: 'Chalet Hideaway II').take
    @floor_plans = @chalet.floor_plans.where(name: 'English')
    @other_chalets = House.where.not(name: 'Chalet Hideaway II').order(:position)
  end
end
