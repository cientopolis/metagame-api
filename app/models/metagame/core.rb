module Metagame
  class Core

    #Main method of Core
    def self.issue_deserved_badges(player_record)

      #Get related badges
      badges = self.deserved_badges(player_record)
      if !badges.nil? && !badges.empty?

        #Issuing
        player = player_record.player
        Player.transaction do
          badges.each{ |b| player.add_badge(b) }
        end

        #New range
        self.give_deserved_promotion(player)

      end

    end

  private

    #Selects the badges related with the project.
    def self.deserved_badges(player_record)

      #From the project we take the related badges
      badges = player_record.project.badges.by_type(player_record.type)
        .less_or_equal_points_than(player_record.value)

      #Check if the player has the badges with the difference of both sets.
      badges = badges - player_record.player.badges
      return badges
    end

    #Promotes rank to one player
    def self.give_deserved_promotion(player)
      new_rank = PlayerRank.where("value <= #{player.badges.count}").order("value ASC").last
      if player.rank.nil? || new_rank.value > player.rank.value

        player.rank = new_rank
        player.save!
      end

    end


  end
end
