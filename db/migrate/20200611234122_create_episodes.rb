class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.integer :eid
      t.string :name
      t.string :file
      t.datetime :completed_at

      t.timestamps
    end
  end
end
