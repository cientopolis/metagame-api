class Level < ActiveRecord::Base

  #Scopes
  scope :issued_before,->(date){where "created_at <= ?",date}
  scope :issued_after, ->(date){where "created_at >= ?",date}

  #Relationships
  belongs_to :player
  belongs_to :badge



end
