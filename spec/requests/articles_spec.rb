require 'rails_helper'

RSpec.describe ArticlesController do
  describe '#index' do
    it 'returns a success response' do
      get '/articles'
      expect(response).to have_http_status(:ok)
    end

    it 'returns a proper JSON' do
      article = create(:article)
      get '/articles'
      expect(json_data.length).to eq(1)
      aggregate_failures do
        expected = json_data.first
        expect(expected[:id]).to eq(article.id.to_s)
        expect(expected[:type]).to eq('article')
        expect(expected[:attributes]).to eq(
          title: article.title,
          content: article.content,
          slug: article.slug
        )
      end
    end
  end
  describe '#show' do
    let(:article) { create(:article) }

    subject { get "/articles/#{article.id}" }

    before { subject }

    it 'returns a success status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
