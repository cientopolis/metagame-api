require 'rails_helper'

describe "Player Ranks", type: :model do

  it "Player is created with Visitor Rank" do
    player = FactoryGirl.create(:player)
    expect(player.rank).to eq(PlayerRank.visitor)
  end

  it "is promoted to Explorer Rank" do
    player = FactoryGirl.create(:player)
    player.add_badge(Badge.find_by(name:"i-was-here"))
    player.add_badge(Badge.find_by(name:"welcome-back"))
    expect(player.rank).to eq(PlayerRank.explorer)
    (player.promoted_on).should_not be_nil
  end

  it "is promoted to CitizenScientist Rank" do
    player = FactoryGirl.create(:player)
    player.rank = PlayerRank.explorer
    player.add_badge(Badge.by_type("contribution").first)
    player.add_badge(Badge.by_type("reinforcement").first)
    player.add_badge(Badge.by_type("dissemination").first)
    expect(player.rank).to eq(PlayerRank.citizen_scientist)
    (player.promoted_on).should_not be_nil

  end

  it "is promoted to ProlificCitizenScientist Rank" do
    player = FactoryGirl.create(:player)
    player.promote_rank(PlayerRank.citizen_scientist)

    badges = FactoryGirl.create_list(:badge,11)
    badges.each{ |b|
      player.add_badge(b)
    }

    expect(player.rank).to eq(PlayerRank.prolific_citizen_scientist)
  end

end
