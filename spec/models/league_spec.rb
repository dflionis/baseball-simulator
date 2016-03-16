require "rails_helper"

RSpec.describe League do
  it { should validate_presence_of(:name) }
  it { should validate_inclusion_of(:dh).in_array([true, false]) }
end
