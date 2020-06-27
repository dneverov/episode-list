class AddOnlineToEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_column :episodes, :online, :boolean, null: true, defailt: nil
  end
end
