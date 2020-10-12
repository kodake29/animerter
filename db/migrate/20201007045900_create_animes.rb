class CreateAnimes < ActiveRecord::Migration[5.2]
  def change
    create_table :animes do |t|
      t.string :title
      t.text :explanation
      t.string :image_id
      t.integer :display_status, default: 0

      t.timestamps
    end
  end
end
