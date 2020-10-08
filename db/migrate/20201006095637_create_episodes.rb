class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|

      t.integer :anime_id
      t.integer :episode_number
      t.string :subtitle
      t.text :explanation
      t.string :image_id
      t.timestamps
    end
  end
end
