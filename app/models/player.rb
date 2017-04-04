class Player < ActiveRecord::Base

  #Relationships
  has_many   :issues
  has_many   :badges, :through => :issues
  has_many   :player_records, class_name:"PlayerRecord"
  belongs_to :rank, class_name: "PlayerRank", :foreign_key => "player_rank_id"

  #Validations
  validates :email, :presence => true

  include Subject

  def initialize(args={})
    super(args)
    self.rank = PlayerRank.visitor
  end

  def promote_rank(new_rank)
    self.rank = new_rank
    self.promoted_on = DateTime.now
  end

  def add_badge(badge)
    self.badges << badge
    #We apply the strategy pattern to check a new rank
    self.rank.reevaluate_rank(self)
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

  def has_badge_of_type?(type)
    self.badges.any?{ |b| b.badge_type == type }
  end

  def badges_issued_after(date)
    issued = self.issues.select{|l| l.created_at >= date}
    issued.map{ |i| Badge.find(i.badge_id) }
  end

  def last_activity
    self.issues.last.created_at
  end

  def record_activity(activity)
    #Find by project
    player_record = find_or_create_record_for(activity)
    #Record on activity record
    player_record.record_on(activity)
    #Notify observers of the change
    notify_observers(activity,player_record)
    player_record
  end

  def find_or_create_record_for(activity)
    player_record = find_record_for(activity.project)
   # We didn't find any PlayerRecord so we create a new one !
   if player_record.nil?
    player_record = add_player_record(activity)
   end
   player_record
  end

  def add_player_record(activity)
    player_record = PlayerRecord.create(project:activity.project,player:activity.player)
    self.player_records << player_record
    player_record
  end

  def find_record_for(project)
    self.player_records.detect{|pr| pr.project == project }
  end

end
