require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:article) { create(:article) }
  let(:board) { create(:board) }

  describe 'GET #show' do
    it 'assigns the requested article to @article' do
      get :show, params: { id: article.id }
      expect(assigns(:article)).to eq(article)
    end

    it 'renders the show template' do
      get :show, params: { id: article.id }
      expect(response).to render_template('show')
    end
  end

  describe 'POST #add_to_board' do
    it 'creates an ArticleBoard record' do
      expect do
        post :add_to_board, params: { article_id: article.id, board_id: board.id }
      end.to change(ArticleBoard, :count).by(1)

      article_board = ArticleBoard.last
      expect(article_board.article).to eq(article)
      expect(article_board.board).to eq(board)
    end

    it 'returns JSON with success status' do
      post :add_to_board, params: { article_id: article.id, board_id: board.id }
      expect(JSON.parse(response.body)).to eq({ 'status' => 'success' })
    end
  end
end
