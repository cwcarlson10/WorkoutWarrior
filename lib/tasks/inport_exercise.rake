namespace :exercise_info do
  desc('pulls in exercise name and description')
  task import_exercise: :environment do
    result_hash = ''
    page = 1

    while page <= 8
      result_hash = HTTParty.get("https://wger.de/api/v2/exercise/?page=#{page}&language=2")

      result_hash['next']
      result_hash['results'].each do |result|
        Exercise.create!(title: result['name'], description: result['description'], category: result['category'])
      end
      page += 1
    end
  end
end