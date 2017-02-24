class Outcome < ActiveRecord::Base
  has_many :plate_appearances
  validates :code, presence: true
end
