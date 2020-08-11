namespace :audio do
  desc "concatenates 2 or more audio files"
  task :concat, [:first, :second, :third, :fourth] => :environment do |task, args|
    # msg = ` sox "|opusdec --force-wav #{args[:first]} -" file.mp3`
  file = download
  end
end
