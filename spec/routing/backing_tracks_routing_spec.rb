require "rails_helper"

RSpec.describe BackingTracksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/backing_tracks").to route_to("backing_tracks#index")
    end

    it "routes to #new" do
      expect(get: "/backing_tracks/new").to route_to("backing_tracks#new")
    end

    it "routes to #show" do
      expect(get: "/backing_tracks/1").to route_to("backing_tracks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/backing_tracks/1/edit").to route_to("backing_tracks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/backing_tracks").to route_to("backing_tracks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/backing_tracks/1").to route_to("backing_tracks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/backing_tracks/1").to route_to("backing_tracks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/backing_tracks/1").to route_to("backing_tracks#destroy", id: "1")
    end
  end
end
