namespace :surveys do

  task update_states: :environment do
    desc 'Updating Survey states...'
    Survey.where(state: 'started').each do |survey|



      survey.state = 'distributed'
      survey.save
    end
  end


end
