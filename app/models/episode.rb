# == Schema Information
#
# Table name: episodes
#
#  id           :bigint           not null, primary key
#  completed_at :datetime
#  eid          :integer
#  file         :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Episode < ApplicationRecord
  validates :eid, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :name, presence: true, uniqueness: true

  def self.assign_from_filename(filename)
    filename_parts = File.basename(filename, ".*").split("-")
    eid = filename_parts.shift.to_i
    name = filename_parts.inject(""){|str, part| str << part.capitalize.prepend(" ")}.lstrip

    episode = Episode.where(eid: eid).first_or_initialize
    episode.assign_attributes(name: name, file: filename)
    episode
  end

  def self.import(dir_path)
    counter = 0

    Dir.new(dir_path).select{|f| !File.directory? f }.sort.each do |fn|
      episode = Episode.assign_from_filename(fn)
      if episode.save
        counter += 1
      else
        puts "#{episode.eid}: #{episode.errors.full_messages.join(', ')}"
      end
    end
    counter
  end

  def toggle_completed
    update(completed_at: (completed_at? ? nil : Time.current))
  end
end
