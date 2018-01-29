kitchen1 = Kitchen.create(name: 'Burgers')
kitchen2 = Kitchen.create(name: 'Pasta')
kitchen3 = Kitchen.create(name: 'Pizza')
kitchen4 = Kitchen.create(name: 'BBQ')
kitchen5 = Kitchen.create(name: 'Vegeterian')

role1 = Role.create(name: 'Management')
role2 = Role.create(name: 'Computer...')
role3 = Role.create(name: 'Other')

participant1 = Participant.create(email: 'meet@eat.de', password: 'hungry', gender: 0, role_id: role1.id)
Preference.find_by(participant_id: participant1.id, kitchen_id: kitchen1.id).update(rating: 4)
Preference.find_by(participant_id: participant1.id, kitchen_id: kitchen2.id).update(rating: 3)
Preference.find_by(participant_id: participant1.id, kitchen_id: kitchen3.id).update(rating: 2)
Preference.find_by(participant_id: participant1.id, kitchen_id: kitchen4.id).update(rating: 5)
Preference.find_by(participant_id: participant1.id, kitchen_id: kitchen5.id).update(rating: 1)

timeslot1 = DateTime.new(2009, 9, 14, 8)
timeslot2 = DateTime.new(2009, 9, 14, 8)
timeslot3 = DateTime.new(2009, 9, 14, 8)

t = Time.now

task2 = Task.create(title: 'Query Phase', survey_start: t, survey_end: t+84600,
                    description: 'This is just a description. Do not mind', timeslot1: timeslot1, timeslot2: timeslot2, timeslot3: timeslot3,
                    algorithm: 0, kitchen_id: kitchen2.id)

task3 = Task.create(title: 'Missed Task', survey_start: t, survey_end: t+120,
                    description: 'This is just a description. Do not mind', timeslot1: timeslot1, timeslot2: timeslot2, timeslot3: timeslot3,
                    algorithm: 0, kitchen_id: kitchen3.id)

task4 = Task.create(title: 'Wating for Result', survey_start: t, survey_end: t+84600,
                    description: 'This is just a description. Do not mind', timeslot1: timeslot1, timeslot2: timeslot2, timeslot3: timeslot3,
                    algorithm: 0, kitchen_id: kitchen4.id)

task5 = Task.create(title: 'Not Invited', survey_start: t, survey_end: t+120,
                    description: 'This is just a description. Do not mind', timeslot1: timeslot1, timeslot2: timeslot2, timeslot3: timeslot3,
                    algorithm: 0, kitchen_id: kitchen5.id)

task6 = Task.create(title: 'Invited', survey_start: t, survey_end: t+120,
                    description: 'This is just a description. Do not mind', timeslot1: timeslot1, timeslot2: timeslot2, timeslot3: timeslot3,
                    algorithm: 0, kitchen_id: kitchen1.id)

task7 = Task.create(title: 'Proof Given', survey_start: t, survey_end: t+120,
                    description: 'This is just a description. Do not mind', timeslot1: timeslot1, timeslot2: timeslot2, timeslot3: timeslot3,
                    algorithm: 0, kitchen_id: kitchen2.id)

TaskRequirement.create(task_id: task2.id, role_id: role1.id, number: 1, timeslot1_acceptance: 0, timeslot2_acceptance: 0, timeslot3_acceptance: 0)

TaskRequirement.create(task_id: task3.id, role_id: role1.id, number: 1, timeslot1_acceptance: 0, timeslot2_acceptance: 0, timeslot3_acceptance: 0)

TaskRequirement.create(task_id: task4.id, role_id: role1.id, number: 1, timeslot1_acceptance: 0, timeslot2_acceptance: 0, timeslot3_acceptance: 1)

TaskRequirement.create(task_id: task5.id, role_id: role1.id, number: 1, timeslot1_acceptance: 1, timeslot2_acceptance: 0, timeslot3_acceptance: 0)

TaskRequirement.create(task_id: task6.id, role_id: role1.id, number: 1, timeslot1_acceptance: 1, timeslot2_acceptance: 1, timeslot3_acceptance: 0)

TaskRequirement.create(task_id: task7.id, role_id: role1.id, number: 1, timeslot1_acceptance: 1, timeslot2_acceptance: 1, timeslot3_acceptance: 1)

Attendance.find_by(participant_id: participant1.id, task_id: task4.id).update(timeslot1: false, timeslot2: false, timeslot3: true, query_state: 2, invitation_state: 0)
Attendance.find_by(participant_id: participant1.id, task_id: task5.id).update(timeslot1: true, timeslot2: false, timeslot3: false, query_state: 2, invitation_state: 0)
Attendance.find_by(participant_id: participant1.id, task_id: task6.id).update(timeslot1: true, timeslot2: true, timeslot3: false, query_state: 2, invitation_state: 1)
Attendance.find_by(participant_id: participant1.id, task_id: task7.id).update(timeslot1: true, timeslot2: true, timeslot3: true, query_state: 2, invitation_state: 2)