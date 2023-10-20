require 'rails_helper'

RSpec.describe UserArticleInteractionsController, type: :controller do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  before do
    sign_in user
  end

  describe 'POST #mark_as_read' do
    context 'when the article is not marked as read' do
      it 'creates a user_article_interaction with interaction_type "read"' do
        expect do
          post :mark_as_read, params: { article_id: article.id }
        end.to change(UserArticleInteraction, :count).by(1)

        interaction = UserArticleInteraction.last
        expect(interaction.interaction_type).to eq('read')
        expect(interaction.user).to eq(user)
        expect(interaction.article).to eq(article)
      end

      it 'returns JSON with success status and type "read"' do
        post :mark_as_read, params: { article_id: article.id }
        expect(JSON.parse(response.body)).to eq({ 'status' => 'success', 'type' => 'read' })
      end
    end

    context 'when the article is already marked as read' do
      before do
        UserArticleInteraction.create(user: user, article: article, interaction_type: 'read')
      end

      it 'deletes the user_article_interaction with interaction_type "read"' do
        expect do
          post :mark_as_read, params: { article_id: article.id }
        end.to change(UserArticleInteraction, :count).by(-1)

        expect(UserArticleInteraction.where(user: user, article: article, interaction_type: 'read')).to be_empty
      end

      it 'returns JSON with success status and type "unread"' do
        post :mark_as_read, params: { article_id: article.id }
        expect(JSON.parse(response.body)).to eq({ 'status' => 'success', 'type' => 'unread' })
      end
    end
  end

  describe 'POST #mark_as_read_later' do
    context 'when the article is not marked as read later' do
      it 'creates a user_article_interaction with interaction_type "read_later"' do
        expect do
          post :mark_as_read_later, params: { article_id: article.id }
        end.to change(UserArticleInteraction, :count).by(1)

        interaction = UserArticleInteraction.last
        expect(interaction.interaction_type).to eq('read_later')
        expect(interaction.user).to eq(user)
        expect(interaction.article).to eq(article)
      end

      it 'returns JSON with success status and type "read_later"' do
        post :mark_as_read_later, params: { article_id: article.id }
        expect(JSON.parse(response.body)).to eq({ 'status' => 'success', 'type' => 'read_later' })
      end
    end

    context 'when the article is already marked as read later' do
      before do
        UserArticleInteraction.create(user: user, article: article, interaction_type: 'read_later')
      end

      it 'deletes the user_article_interaction with interaction_type "read_later"' do
        expect do
          post :mark_as_read_later, params: { article_id: article.id }
        end.to change(UserArticleInteraction, :count).by(-1)

        expect(UserArticleInteraction.where(user: user, article: article, interaction_type: 'read_later')).to be_empty
      end

      it 'returns JSON with success status and type "no_read_later"' do
        post :mark_as_read_later, params: { article_id: article.id }
        expect(JSON.parse(response.body)).to eq({ 'status' => 'success', 'type' => 'no_read_later' })
      end
    end
  end
end
