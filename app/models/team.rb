class Team < ActiveRecord::Base
  belongs_to :division

  validates :division, presence: true
  validates :city, presence: true
  validates :name, presence: true, uniqueness: true

  def full_name
    city + " " + name
  end
end
