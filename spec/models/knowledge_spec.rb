require 'rails_helper'

RSpec.describe Knowledge, type: :model do
  before do
    @knowledge = FactoryBot.build(:knowledge)
  end

  describe '新規知識情報登録' do
    context '新規知識情報が登録できる場合' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@knowledge).to be_valid
      end
    end

    context '新規知識情報が登録できない場合' do
      it 'knowledge_titleが空では登録できない' do
        @knowledge.knowledge_title = ''
        @knowledge.valid?
        expect(@knowledge.errors.full_messages).to include("Knowledge title can't be blank")
      end

      it 'knowledge_infoが空では登録できない' do
        @knowledge.knowledge_info = ''
        @knowledge.valid?
        expect(@knowledge.errors.full_messages).to include("Knowledge info can't be blank")
      end

      it 'imageが空では登録できない' do
        @knowledge.image = nil
        @knowledge.valid?
        expect(@knowledge.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと登録できない' do
        @knowledge.user = nil
        @knowledge.valid?
        expect(@knowledge.errors.full_messages).to include('User must exist')
      end
    end
  end
end
