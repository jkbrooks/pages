require "spec_helper" 

describe Api::PagesController do
  describe "default routing" do

    it "routes to #index" do
      get("/api/pages").should route_to("api/pages#index")
    end

    it "routes to #new" do
      get("/api/pages/new").should route_to("api/pages#new")
    end

    it "routes to #show" do
      get("/api/pages/1").should route_to("api/pages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/api/pages/1/edit").should route_to("api/pages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/api/pages").should route_to("api/pages#create")
    end

    it "routes to #update" do
      put("/api/pages/1").should route_to("api/pages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/api/pages/1").should route_to("api/pages#destroy", :id => "1")
    end
  end

  describe "custom routing" do 
    it "routes to #publish" do
      post("/api/pages/1/publish").should route_to("api/pages#publish", id: "1")
    end

    it "routes to #published" do
      get("/api/pages/published").should route_to("api/pages#published")
    end

    it "routes to #unpublished" do
      get("/api/pages/unpublished").should route_to("api/pages#unpublished")
    end

    it "routes to #total_words" do
      get("/api/pages/1/total_words").should route_to("api/pages#total_words", id: "1")
    end
  end
end
