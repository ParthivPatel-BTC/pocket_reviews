class CreateReviews < ActiveRecord::Migration
  def up
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating
      t.datetime :submitted_on
      t.boolean :posted_status
      t.datetime :posted_on
      t.integer :client_id
      t.integer :customer_id

      t.timestamps
    end
    add_index :reviews, :client_id
    add_index :reviews, :customer_id
  end

  def down
    drop_table(:reviews)
  end
end