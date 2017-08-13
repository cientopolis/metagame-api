require 'securerandom'

class Project < ActiveRecord::Base

  #This set an auth token for HTTP token authentication
  before_create :set_auth_token

  has_many :badges

  validates :name, uniqueness:true

  def badges_by_type(ativity_type)
    self.badges.by_type(ativity_type)
  end

  private
  def set_auth_token
    return if token_value.present?
    self.token_value = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

end
