require 'rails_helper'

describe Game, :type => :model do
  it 'has a valid factory' do
    expect(build(:game)).to be_instance_of(Game)
  end

  it { should respond_to :title }
  it { should validate_presence_of :title }
  it { should validate_length_of(:title).is_at_least(2) }
  it { should validate_uniqueness_of :title }
end
