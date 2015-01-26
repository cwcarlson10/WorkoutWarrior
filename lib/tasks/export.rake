require 'csv'

namespace :export do

  desc 'Exports Trainer Data'
  task :trainers => :environment do
    USER_HEADERS = ['email']
    TRAINER_HEADERS = ['name', 'organization', 'certifications']
    ALL_HEADERS = USER_HEADERS + TRAINER_HEADERS
    @file_name = 'db/trainers.csv'

    # Initialize file
    if File.exists?(@file_name)
      File.truncate(@file_name, 0)
    end

    csv_file = CSV.open(@file_name, 'wb')
    csv_file << ALL_HEADERS

    users = User.all
    users.each do |user|
      if user.role = 'trainer'
        data = [user.email]
        trainer = Trainer.find_by_user_id(user.id)
        if trainer
          data += trainer.slice(*TRAINER_HEADERS).values
          csv_file << data
        end
      end
    end
  end
end
