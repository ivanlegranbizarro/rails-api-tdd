require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '.recent' do
    it 'returns articles in the correct order' do
      older_articles = create(:article, created_at: 1.hour.ago)
      recent_articles = create(:article)

      expect(described_class.recent).to eq([recent_articles, older_articles])
    end
  end
end
