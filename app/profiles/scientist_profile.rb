class ScientistProfile

  include Singleton

  def self.all_profiles
    [Generalist,Networker,Specialist,Disseminator]
  end

  def self.matches(player)
    profile = self.all_profiles.detect {|profile| profile.matches(player) }
    #We return a singleton of the profile.
    return profile.instance if profile
    Generalist.instance
  end

end
