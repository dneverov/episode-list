class AddIndexEidNameToEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_index :episodes, :eid,  unique: true
    add_index :episodes, :name, unique: true
  end
end
