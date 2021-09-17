require 'rails_helper'

RSpec.describe ItemComment, type: :model do
  before do
    @item_comment = FactoryBot.build(:item_comment)
  end

  describe '商品情報のコメント投稿機能' do
    context 'コメントが投稿できる場合' do
      it "テキストを投稿できる" do
        expect(@item_comment).to be_valid
      end
    end

    context 'コメントが投稿できない場合' do
      it "テキストが空では投稿できない" do
        @item_comment.text = ''
        @item_comment.valid?
        expect(@item_comment.errors.full_messages).to include("Text can't be blank")
      end

      it "userが紐付いていないと投稿できない" do
        @item_comment.user = nil
        @item_comment.valid?
        expect(@item_comment.errors.full_messages).to include("User must exist")
      end

      it "itemが紐付いていないと投稿できない" do
        @item_comment.item = nil
        @item_comment.valid?
        expect(@item_comment.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
