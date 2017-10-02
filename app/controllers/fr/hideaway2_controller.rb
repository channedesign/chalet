class Fr::Hideaway2Controller < ApplicationController
  layout 'french'
  def index
    @chalet = House.where(name: 'Chalet Hideaway II').take
    @other_chalets = House.where.not(name: 'Chalet Hideaway II').order(:position)
  end
end
