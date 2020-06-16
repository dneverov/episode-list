class AddProjectIdToEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_column :episodes, :project_id, :integer
  end
end
