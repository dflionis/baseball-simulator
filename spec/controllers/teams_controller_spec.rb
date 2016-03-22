require "rails_helper"

RSpec.describe TeamsController do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns @teams" do
      red_sox = create(:red_sox)
      get :index
      expect(assigns(:teams)).to eq([red_sox])
    end
  end
end
