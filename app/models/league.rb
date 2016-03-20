class League < ActiveRecord::Base
  has_many :divisions

  validates :name, presence: true, uniqueness: true
  validates :dh, inclusion: [true, false]
end
