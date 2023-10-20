class ChangeInteractionTypeToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :user_article_interactions, :interaction_type, :integer
  end
end
