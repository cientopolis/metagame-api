class Project < ActiveRecord::Base

  has_many :badges

  validates :name, uniqueness:true

  def badges_by_type(ativity_type)
    self.badges.by_type(ativity_type)
  end

end
