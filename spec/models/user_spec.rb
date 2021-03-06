require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  it "#api_key" do
    user1 = create(:user)
    u1key = user1.api_key
    expect(u1key).to_not be_nil
  end
end
