# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Projects

galaxy_conqueror = Project.create(name:"galaxy-conqueror")


#Badges

#Tutorial badges
Badge.create(name:"i-was-here",project_id:galaxy_conqueror.id,points:1,badge_type:"login")
Badge.create(name:"welcome-back",project_id:galaxy_conqueror.id,points:2,badge_type:"login")

#Unit of Work badges
cont_badge = Badge.create(name:"First contribution",points:2,project_id:galaxy_conqueror.id,badge_type:"contribution")

cont_badge_2 = Badge.create(name:"2 contribution",points:4,project_id:galaxy_conqueror.id,badge_type:"contribution")

cont_badge_3 = Badge.create(name:"3 contribution",points:8,project_id:galaxy_conqueror.id,badge_type:"contribution")

cont_badge_4 = Badge.create(name:"4 contribution",points:10,project_id:galaxy_conqueror.id,badge_type:"contribution")


#Reinforcement badge
cont_badge = Badge.create(name:"First reinforcement",points:10,project_id:galaxy_conqueror.id,badge_type:"reinforcement")

cont_badge = Badge.create(name:"2 reinforcement",points:30,project_id:galaxy_conqueror.id,badge_type:"reinforcement")

cont_badge = Badge.create(name:"3 reinforcement",points:50,project_id:galaxy_conqueror.id,badge_type:"reinforcement")

#Dissemination badges

social_badge = Badge.create(name:"Share on Fb",project_id:galaxy_conqueror.id,badge_type:"dissemination")



#Ranks

range = PlayerRank.create(name:"Visitor",type:"Visitor")
range = PlayerRank.create(name:"Explorer",type:"Explorer")
range = PlayerRank.create(name:"Citizen Scientist",type:"CitizenScientist")
range = PlayerRank.create(name:"Prolific Citizen Scientist",type:"ProlificCitizenScientist")
range = PlayerRank.create(name:"Commited Citizen Scientist",type:"CommitedCitizenScientist")
range = PlayerRank.create(name:"Visionary",type:"VisionaryCitizenScientist")


#Players

player = Player.create(email:"santiagopravisani@gmail.com")

#player.add_badge(cont_badge)


