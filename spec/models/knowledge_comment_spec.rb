require 'rails_helper'

RSpec.describe KnowledgeComment, type: :model do
  before do
    @knowledge_comment = FactoryBot.build(:knowledge_comment)
  end

  describe '知識情報のコメント投稿機能' do
    context 'コメントが投稿できる場合' do
      it 'テキストを投稿できる' do
        expect(@knowledge_comment).to be_valid
      end
    end

    context 'コメントが投稿できない場合' do
      it 'テキストが空では投稿できない' do
        @knowledge_comment.text = ''
        @knowledge_comment.valid?
        expect(@knowledge_comment.errors.full_messages).to include("Text can't be blank")
      end

      it 'userが紐付いていないと投稿できない' do
        @knowledge_comment.user = nil
        @knowledge_comment.valid?
        expect(@knowledge_comment.errors.full_messages).to include('User must exist')
      end

      it 'knowledgeが紐付いていないと投稿できない' do
        @knowledge_comment.knowledge = nil
        @knowledge_comment.valid?
        expect(@knowledge_comment.errors.full_messages).to include('Knowledge must exist')
      end
    end
  end
end
