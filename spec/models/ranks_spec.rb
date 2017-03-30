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
    expect(player.promoted_on).not_to be_nil
  end

  it "is promoted to CitizenScientist Rank" do
    player = FactoryGirl.create(:player)
    player.rank = PlayerRank.explorer
    player.add_badge(Badge.by_type("contribution").first)
    player.add_badge(Badge.by_type("reinforcement").first)
    player.add_badge(Badge.by_type("dissemination").first)

    expect(player.rank).to eq(PlayerRank.citizen_scientist)
    expect(player.promoted_on).not_to be_nil

  end

  it "is promoted to ProlificCitizenScientist Rank" do
    player = FactoryGirl.create(:player)
    #Promote
    player.promote_rank(PlayerRank.citizen_scientist)
    #Wait 1 second to have difference between time of promoting and new badges
    sleep(1.seconds)
    #New badges for player
    new_badges = FactoryGirl.create_list(:badge,10)
    new_badges.each{ |b| player.add_badge(b) }

    expect(player.rank).to eq(PlayerRank.prolific_citizen_scientist)
  end

  it "is promoted to CommitedCitizenScientist Rank" do
    player = FactoryGirl.create(:player)
    player.promote_rank(PlayerRank.prolific_citizen_scientist)
    badge =  FactoryGirl.create(:badge)
    player.add_badge(badge)

    expect(player.rank).to eq(PlayerRank.commited_citizen_scientist)
  end

  it "is promoted to VisionaryCitizenScientist" do
    player = FactoryGirl.create(:player)
    player.promote_rank(PlayerRank.visionary_citizen_scientist)

    expect(player.rank).to eq(PlayerRank.visionary_citizen_scientist)

  end

end
