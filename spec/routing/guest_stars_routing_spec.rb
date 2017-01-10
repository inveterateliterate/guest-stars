require "rails_helper"

RSpec.describe GuestStarsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/guest_stars").to route_to("guest_stars#index")
    end

    it "routes to #new" do
      expect(:get => "/guest_stars/new").to route_to("guest_stars#new")
    end

    it "routes to #show" do
      expect(:get => "/guest_stars/1").to route_to("guest_stars#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/guest_stars/1/edit").to route_to("guest_stars#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/guest_stars").to route_to("guest_stars#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/guest_stars/1").to route_to("guest_stars#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/guest_stars/1").to route_to("guest_stars#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/guest_stars/1").to route_to("guest_stars#destroy", :id => "1")
    end

  end
end
