class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body, null: false
      t.datetime :created_at, null: false
      t.integer :restaurant_id, null: false
    end
  end
end
