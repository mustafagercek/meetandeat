kitchen1 = Kitchen.create(name: 'Mexican')
kitchen2 = Kitchen.create(name: 'Burger')
kitchen3 = Kitchen.create(name: 'Chicken')
kitchen4 = Kitchen.create(name: 'Sandwiches')
kitchen5 = Kitchen.create(name: 'Diner')

role1 = Role.create(name: 'Management')
role3 = Role.create(name: 'Other')

participant1 = Participant.create(email: '1', password: '1', role_id: role1.id)
participant2 = Participant.create(email: '2', password: '1', role_id: role3.id)

task1 = Task.create(title: 'title', description: 'description', survey_start: Time.new(2015, 12, 8, 10, 19), survey_end: Time.new(2025, 12, 8, 10, 19), algorithm: 0, kitchen_id: kitchen1.id)

taskRequirement1 = TaskRequirement.create(task_id: task1.id, role_id: role1.id, number: 3)
taskRequirement1 = TaskRequirement.create(task_id: task1.id, role_id: role3.id, number: 3)

