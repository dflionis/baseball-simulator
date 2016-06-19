require "rails_helper"

RSpec.describe Dice do
  describe ".roll_20_sided_die" do
    it "always rolls an integer between a 1 and a 20" do
      100.times { expect(1..20).to include(Dice.roll_20_sided_die) }
    end
  end

  describe ".roll" do
    it "formats the roll correctly" do
      results = []
      100.times { results << Dice.roll }

      results.each do |result|
        white_die = result.first
        red_dice = result.last

        expect("1".."6").to include(white_die)
        expect("1".."12").to include(red_dice)
      end
    end
  end
end
