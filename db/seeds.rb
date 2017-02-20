# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Types
contribution = ActivityType.create(name:"contribution")
reinforcement = ActivityType.create(name:"reinforcement")
social = ActivityType.create(name:"social")

#Projects

galaxy_conqueror = Project.create(name:"galaxy-conqueror")


#Badges

#Contribution badge
cont_badge = Badge.create(name:"First contribution",points:2,
  activity_type_id:contribution.id,project_id:galaxy_conqueror.id)

cont_badge_2 = Badge.create(name:"2 contribution",points:4,
  activity_type_id:contribution.id,project_id:galaxy_conqueror.id)

cont_badge_3 = Badge.create(name:"3 contribution",points:8,
  activity_type_id:contribution.id,project_id:galaxy_conqueror.id)

cont_badge_4 = Badge.create(name:"4 contribution",points:10,
  activity_type_id:contribution.id,project_id:galaxy_conqueror.id)


#Reinforcement badge
cont_badge = Badge.create(name:"First reinforcement",points:10,
  activity_type_id:reinforcement.id,project_id:galaxy_conqueror.id)

cont_badge = Badge.create(name:"2 reinforcement",points:30,
  activity_type_id:reinforcement.id,project_id:galaxy_conqueror.id)

cont_badge = Badge.create(name:"3 reinforcement",points:50,
  activity_type_id:reinforcement.id,project_id:galaxy_conqueror.id)

#Social badge

social_badge = Badge.create(name:"Share on Fb",
  activity_type_id:social.id,project_id:galaxy_conqueror.id)


#Ranges

range = PlayerRank.create(name:"Principiante",value:1)
range = PlayerRank.create(name:"Groso",value:3)
range = PlayerRank.create(name:"Mega Groso",value:4)
range = PlayerRank.create(name:"Ultra Groso",value:9)


#Players

player = Player.create(email:"santiagopravisani@gmail.com")

#player.add_badge(cont_badge)


