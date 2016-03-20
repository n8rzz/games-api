require 'rails_helper'

describe Game, :type => :model do
  it 'has valid factories' do
    expect(build(:game)).to be_instance_of(Game)
    expect(build(:new_game)).to be_instance_of(Game)
  end

  it { should respond_to :title }
  it { should validate_presence_of :title }
  it { should validate_length_of(:title).is_at_least(2) }
  it { should validate_uniqueness_of :title }
  it { should respond_to :status }
  it { should validate_presence_of :status }
  it { should respond_to :votes }
end
