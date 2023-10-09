def mark_as_read
  article = Article.find(params[:article_id])
  interaction_type = 'Read' # Use the appropriate interaction type

  # Create or update a UserArticleInteraction record
  current_user.user_article_interactions.find_or_create_by(article: article) do |interaction|
    interaction.interaction_type = interaction_type
  end

  # You can respond with JSON or a success message as needed
  render json: { status: 'success' }
end