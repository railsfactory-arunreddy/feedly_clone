class CreateUserFeedActions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_feed_actions do |t|
      t.references :user, foreign_key: true
      t.references :feed, foreign_key: true
      t.string :action_type

      t.timestamps
    end
  end
end