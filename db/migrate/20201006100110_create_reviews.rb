class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :episode_id
      t.integer :user_id
      t.string :comment
      t.integer :release_status, default: 0
      t.integer :private_status, default: 0
      t.float :rate, null: false, default: 0
      t.timestamps
    end
  end
end
