namespace :attendances do
  desc 'Updating Task states...'
  task update_states: :environment do
    Task.all.each do |task|
      task.set_state
      task.save
    end
  end

  task notify_user: :environment do
    desc 'Notifying user...'
    is_finished = false
    Task.where(survey_state: 1).each do |task|
      next if task.current_level <= 0
      puts 'Number of task requirenents ' + task.task_requirements.length.to_s
      i = 1
      num = 3
      while i <= num
        number_of_reaches = 0
        task.task_requirements.each do |task_requirement|
          number_of_reaches += (task_requirement.isNumberReached(i) ? 1 : 0)
        end
        is_finished = number_of_reaches == task.task_requirements.length
        break if is_finished
        i += 1
      end

      if is_finished
        task.current_level = -1
        task.save

      else
        task.current_level -= 1
        task.save

        attendances = Attendance.includes(participant: :preferences)
                          .where(task_id: task.id, query_state: 0,
                                 participants: {preferences: {kitchen_id: task.kitchen_id, rating: task.current_level}})
        puts 'Number of possible attendances: ' + attendances.length.to_s
        attendances.each do |attendance|
          #TODO: PUSH NOTIFICATION
          attendance.query_state = 1
          attendance.save
        end
      end
    end
  end
end
