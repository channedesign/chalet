class Hideaway1Controller < ApplicationController
  def index
    @chalet1 = House.first
  end
end
