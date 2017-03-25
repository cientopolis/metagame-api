class Player < ActiveRecord::Base

  #Relationships
  has_many   :levels
  has_many   :badges, :through => :levels
  has_many   :player_records, class_name:"PlayerRecord"

  belongs_to :rank, class_name: "PlayerRank", :foreign_key => "player_rank_id", autosave: true

  #Validations
  validates :email, :presence => true

  def initialize(args=nil)
    super(args)
    self.rank = PlayerRank.visitor
  end

  def add_badge(badge)
    self.badges << badge
  end

  def remove_badge(badge)
    self.badges.delete(badge)
  end

  def has_badge?(badge)
    #Returns true if player has the badge
    self.badges.detect?(badge)
  end

  def has_badges?(_badges)
    #Returns true if player has _badges in its collection
    (_badges - self.badges).empty?
  end

  def record_activity(activity)

    binding.pry

   # #Find
   # player_record = self.player_records
   # .detect{|pr| pr.project == activity.project }
   # # We didn't find any PlayerRecord so we create a new one !
   # if player_record.nil?
   #    player_record = PlayerRecord.new
   #    self.player_records << player_record.new_from_activity(activity)
   # end
   # #Update player_record values
   # player_record.update_values(activity.count.to_i)

  end

end
