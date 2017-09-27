class Hideaway2Controller < ApplicationController
  def index
    @chalet = House.where(name: 'Chalet Hideaway II').take
  end
end
