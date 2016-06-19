module Dice
  def self.roll_20_sided_die
    rand(20) + 1
  end

  def self.roll
    [roll_white_die, roll_red_dice]
  end

  private

  def self.roll_white_die
    (rand(6) + 1).to_s
  end

  def self.roll_red_dice
    ((rand(6) + 1) + (rand(6) + 1)).to_s
  end
end
