namespace :episode do

  desc "Scan a directory for downloaded files"
  task import: :environment do
    dir_path = '/home/denis/Загрузки/torrents/GoRails'
    counter = 0

    Dir.new(dir_path).select{|f| !File.directory? f }.sort.each do |fn|
      episode = Episode.assign_from_filename(fn)
      if episode.save
        counter += 1
      else
        puts "#{episode.eid}: #{episode.errors.full_messages.join(', ')}"
      end
    end
    puts "\n  Episodes count: #{counter}"
  end
end
