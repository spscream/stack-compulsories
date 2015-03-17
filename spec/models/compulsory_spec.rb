require 'rails_helper'

RSpec.describe Compulsory, type: :model do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:discipline)}
    it { should define_enum_for(:discipline).with([:di, :dp, :dt, :mi, :mp, :mt])}
end
