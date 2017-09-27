class Hideaway1Controller < ApplicationController
  def index
    @chalet = House.where(name: 'Chalet Hideaway I').take
  end
end
