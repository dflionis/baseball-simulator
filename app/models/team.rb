class Team < ActiveRecord::Base
  belongs_to :division

  has_many :players

  validates :division, presence: true
  validates :city, presence: true
  validates :name, presence: true, uniqueness: true

  def full_name
    city + " " + name
  end
end
