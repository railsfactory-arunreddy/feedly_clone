class CreateFeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :feeds do |t|
      t.string :title
      t.text :description
      t.string :url, null: false

      t.timestamps
    end
  end
end
