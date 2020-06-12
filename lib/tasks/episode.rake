namespace :episode do

  desc "Scan a directory for downloaded files"
  task import: :environment do
    dir_path = '/home/denis/Загрузки/torrents/GoRails'
    counter = Episode.import(dir_path)
    puts "\n  Episodes count: #{counter}"
  end
end
