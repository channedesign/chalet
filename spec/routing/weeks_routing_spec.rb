require "rails_helper"

RSpec.describe WeeksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/weeks").to route_to("weeks#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/weeks/new").to route_to("weeks#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/weeks/1").to route_to("weeks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/weeks/1/edit").to route_to("weeks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/weeks").to route_to("weeks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/weeks/1").to route_to("weeks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/weeks/1").to route_to("weeks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/weeks/1").to route_to("weeks#destroy", :id => "1")
    end

  end
end
