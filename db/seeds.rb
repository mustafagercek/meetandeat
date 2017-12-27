# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


kitchen1 = Kitchen.create(name: 'Asiatisch')
kitchen2 = Kitchen.create(name: 'Türkisch')
kitchen3 = Kitchen.create(name: 'Deutsch')
kitchen4 = Kitchen.create(name: 'Italienisch')

role1 = Role.create(name: 'Wifo')
role2 = Role.create(name: 'BWL')
role3 = Role.create(name: 'Jura')
role4 = Role.create(name: 'Wipäd')
role5 = Role.create(name: 'Other')

task = Task.create(title: 'Task Title', survey_start: DateTime.new(2009, 9, 14, 8), survey_end: DateTime.new(2020, 9, 15, 8),
                   description: 'This is just a description. Do not mind', timeslot1: DateTime.new(2009, 9, 14, 8), timeslot2: DateTime.new(2009, 9, 14, 8),
                   algorithm: 0, kitchen_id: kitchen1.id)

participant1 = Participant.create(email: 'markojeftic2@web.de', password: 'boy2', gender: 0, role_id: role1.id)
participant2 = Participant.create(email: 'markojeftic3@web.de', password: 'boy2', gender: 1, role_id: role2.id)
participant3 = Participant.create(email: 'markojeftic4@web.de', password: 'boy2', gender: 1, role_id: role3.id)

participant1 = Participant.create(email: 'markojeftic5@web.de', password: 'boy2', gender: 0, role_id: role1.id)
participant2 = Participant.create(email: 'markojeftic6@web.de', password: 'boy2', gender: 1, role_id: role2.id)
participant3 = Participant.create(email: 'markojeftic7@web.de', password: 'boy2', gender: 1, role_id: role3.id)

TaskRequirement.create(task_id: task.id, role_id: role1.id, number: 1, timeslot1_acceptance: 0, timeslot2_acceptance: 0, timeslot3_acceptance: 0)
TaskRequirement.create(task_id: task.id, role_id: role2.id, number: 1, timeslot1_acceptance: 0, timeslot2_acceptance: 0, timeslot3_acceptance: 0)
TaskRequirement.create(task_id: task.id, role_id: role3.id, number: 1, timeslot1_acceptance: 0, timeslot2_acceptance: 0, timeslot3_acceptance: 0)
