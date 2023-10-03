class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.references :feed, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.string :link
      t.string :display_image
      t.datetime :published_at

      t.timestamps
    end
  end
end
