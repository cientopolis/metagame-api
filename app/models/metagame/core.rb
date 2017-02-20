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
    def self.give_deserved_promotion(player)

      new_range = PlayerRank.where("value <= #{player.badges.count}").order("value ASC").last
      if player.player_range.nil? || new_range.value > player.player_range.value

        player.player_range = new_range
        player.save!
      end

    end

    #Selects the badges related with the project.
    def self.deserved_badges(player_record)

      new_points = player_record.value
      ty_id = player_record.type_id
      player = player_record.player
      project = player_record.project
      #All the badges from project with the condition
      badges = project.badges.where(" points <= #{new_points} && points > 0 && type_id = #{ty_id}") || []
      #Check if the player has the badges with the difference of both sets.
      badges = badges - player.badges
      badges
    end

  end
end
