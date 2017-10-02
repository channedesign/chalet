class PandaController < ApplicationController
  def index
    @chalet = House.where(name: 'Panda').take
    @other_chalets = House.where.not(name: 'Panda').order(:position)
  end
end
