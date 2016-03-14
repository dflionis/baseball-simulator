class League < ActiveRecord::Base
  validates :name, presence: true
  validates :dh, inclusion: [true, false]
end
