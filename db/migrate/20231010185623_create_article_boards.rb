class CreateArticleBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :article_boards do |t|
      t.references :article, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
