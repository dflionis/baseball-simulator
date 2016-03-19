class League < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :dh, inclusion: [true, false]
end
