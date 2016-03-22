require "rails_helper"

describe "teams/index.html.erb" do
  it "displays all of the teams" do
    assign(:teams, [create(:red_sox)])

    render

    expect(rendered).to match /Red Sox/
  end
end
