class PandaController < ApplicationController
  def index
    @chalet = House.where(name: 'Panda').take
    @floor_plans = @chalet.floor_plans
    @other_chalets = House.where.not(name: 'Panda').order(:position)
  end
end
