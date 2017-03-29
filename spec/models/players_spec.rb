require 'rails_helper'

describe "Players", type: :model do

  it "is not valid without an email" do
    player = Player.new(email: nil)
    expect(player).to_not be_valid
  end

  it "is valid with email" do
    #Creates a player with random email
    player = FactoryGirl.create(:player)
    expect(player).to be_valid
  end

  it "is created with Visitor Rank" do
    player = FactoryGirl.create(:player)
    expect(player.rank.name).to eq("Visitor")
  end

end
