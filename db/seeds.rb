# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Task.create(title: 'Task Title', survey_start: DateTime.new(2009, 9, 14, 8), survey_end: DateTime.new(2020, 9, 15, 8),
            description: 'This is just a description. Do not mind', timeslot1: true, timeslot2: false, timeslot3: true, participantslot1: true, participantslot2: false, participantslot3: false)
