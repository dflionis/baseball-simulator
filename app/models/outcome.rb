class Outcome < ApplicationRecord
  has_many :plate_appearances
  validates :code, presence: true

  after_initialize :set_default_values

  private

  def set_default_values
    self.ab = true if self.ab.nil?
    self.h ||= false
    self.bb ||= false
    self.so ||= false
    self.double ||= false
    self.triple ||= false
    self.hr ||= false
  end
end
