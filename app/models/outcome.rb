class Outcome < ApplicationRecord
  has_many :plate_appearances
  validates :code, presence: true
end
