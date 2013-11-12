class CreateReviewStatuses < ActiveRecord::Migration
  def up
    create_table :review_statuses do |t|
      t.boolean :is_posted, default: false
      t.datetime :posted_on
      t.boolean :is_visible, default: false
      t.datetime :visible_on
      t.integer :client_url_id
      t.integer :review_id

      t.timestamps
    end
  end

  def down
    drop_table :review_statuses
  end
end
