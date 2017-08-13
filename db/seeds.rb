# It is created in this file the

#Projects
cientopolis = Project.create(name:"cientopolis")

#Player
player = Player.create(email:"santiagopravisani@gmail.com")

#Tutorial badges
Badge.create(name:"i-was-here",project_id:cientopolis.id,points:1,badge_type:"login")
Badge.create(name:"welcome-back",project_id:cientopolis.id,points:2,badge_type:"login")

#Unit of Work badges
Badge.create(name:"first-contribution",points:2,project_id:cientopolis.id,badge_type:"contribution")
Badge.create(name:"second-contribution",points:4,project_id:cientopolis.id,badge_type:"contribution")

#Back and forth badges
Badge.create(name:"first-reinforcement",points:10,project_id:cientopolis.id,badge_type:"reinforcement")
Badge.create(name:"second-reinforcement",points:30,project_id:cientopolis.id,badge_type:"reinforcement")

#Dissemination badges
Badge.create(name:"Share-on-Facebook",points:1,project_id:cientopolis.id,badge_type:"dissemination")
Badge.create(name:"Share-on-Twitter",points:1,project_id:cientopolis.id,badge_type:"dissemination")

# #Ranks
PlayerRank.create(name:"Visitor",type:"Visitor")
PlayerRank.create(name:"Explorer",type:"Explorer")
PlayerRank.create(name:"Citizen Scientist",type:"CitizenScientist")
PlayerRank.create(name:"Prolific Citizen Scientist",type:"ProlificCitizenScientist")
PlayerRank.create(name:"Commited Citizen Scientist",type:"CommitedCitizenScientist")
PlayerRank.create(name:"Visionary",type:"VisionaryCitizenScientist")
