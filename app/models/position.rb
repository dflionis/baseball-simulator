class Position < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true
  validates :scorebook_id, presence: true
end
