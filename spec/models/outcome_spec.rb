require "rails_helper"

RSpec.describe Outcome do
  it { should validate_presence_of(:code) }

  it { should have_many(:plate_appearances) }

  it { should have_db_index(:code) }
end
