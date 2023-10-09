class CreateUserArticleInteractions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_article_interactions do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.string :interaction_type
      t.timestamps
    end
  end
end