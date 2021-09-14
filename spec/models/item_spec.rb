require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品情報登録' do
    context '新規商品情報が登録できる場合' do
      it "全ての値が正しく入力されていれば登録できる" do
        expect(@item).to be_valid
      end

      it "item_infoが空でも登録できる" do
        @item.item_info = ''
        expect(@item).to be_valid
      end
    end

    context '新規商品情報が登録できない場合' do
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it "makerが空では登録できない" do
        @item.maker = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Maker can't be blank")
      end

      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "pliceが空では登録できない" do
        @item.plice = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Plice can't be blank")
      end

      it "bought_storeが空では登録できない" do
        @item.bought_store = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Bought store can't be blank")
      end

      it "userが紐付いていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it "pliceが0の場合登録できない" do
        @item.plice = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Plice is out of setting range")
      end

      it "pliceが10,000,000以上の場合登録できない" do
        @item.plice = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Plice is out of setting range")
      end

      it "pliceに文字列が入っている場合登録できない" do
        @item.plice = '300en'
        @item.valid?
        expect(@item.errors.full_messages).to include("Plice is not a number")
      end

      it "pliceが全角数字の場合登録できない" do
        @item.plice = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Plice is out of setting range", "Plice is not a number")
      end
    end
  end
end
