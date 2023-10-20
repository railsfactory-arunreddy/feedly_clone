class UserArticleInteractionsController < ApplicationController
  def mark_as_read
    article = Article.find(params[:article_id])
    interaction_type = 'read'
    #binding.pry

    user_article_interaction = UserArticleInteraction.find_by(user: current_user, article: article, interaction_type: interaction_type)

    if user_article_interaction
      user_article_interaction.delete
      render json: { status: 'success', type: 'unread' }
    else
      current_user.user_article_interactions.create!(article: article) do |interaction|
        interaction.interaction_type = interaction_type
      end
      render json: { status: 'success', type: 'read' }
    end
  end

  def mark_as_read_later
    article = Article.find(params[:article_id])
    interaction_type = 'read_later'

    user_article_interaction = UserArticleInteraction.find_by(user: current_user, article: article, interaction_type: interaction_type)

    if user_article_interaction
      user_article_interaction.delete
      render json: { status: 'success', type: 'no_read_later' }
    else
      current_user.user_article_interactions.create!(article: article) do |interaction|
        interaction.interaction_type = interaction_type
      end
      render json: { status: 'success', type: 'read_later' }
    end
  end
end