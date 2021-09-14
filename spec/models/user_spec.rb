require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end

      it 'os_typeを選択していなくても登録できる' do
        @user.os_type_id = 0
        expect(@user).to be_valid
      end

      it 'use_app1が空でも登録できる' do
        @user.use_app1 = ''
        expect(@user).to be_valid
      end

      it 'use_app2が空でも登録できる' do
        @user.use_app2 = ''
        expect(@user).to be_valid
      end

      it 'profileが空でも登録できる' do
        @user.profile = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'prefectureを選択していないと保存できない' do
        @user.prefecture_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'phone_namberが空だと保存できない' do
        @user.phone_namber = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone namber can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123abcd'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it 'passwordが英文字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it 'last_nameが半角カナでは登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end

      it 'last_nameが全角英字では登録できない' do
        @user.last_name = 'ｙａｍａｄａﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end

      it 'last_nameが英字では登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end

      it 'first_nameが半角カナでは登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end

      it 'first_nameが全角英字では登録できない' do
        @user.first_name = 'ｔａｒｏｕ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end

      it 'first_nameが英字では登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end

      it 'last_name_kanaが半角カナでは登録できない' do
        @user.last_name_kana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end

      it 'last_name_kanaがひらがなでは登録できない' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters") 
      end

      it 'last_name_kanaが漢字では登録できない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end

      it 'last_name_kanaが英字では登録できない' do
        @user.last_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end

      it 'first_name_kanaが半角カナでは登録できない' do
        @user.first_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end

      it 'first_name_kanaがひらがなでは登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end

      it 'first_name_kanaが漢字では登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end

      it 'first_name_kanaが英字では登録できない' do
        @user.first_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end

      it '重複したphone_namberが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, phone_namber: @user.phone_namber)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Phone namber has already been taken")
      end

      it 'phone_namberが半角数字以外だと保存できない' do
        @user.phone_namber = '１２３４５６７８９０１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone namber is invalid. Input only half-width namber")
      end

      it 'phone_namberが9文字以下だと保存できない' do
        @user.phone_namber = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone namber is too short")
      end

      it 'phone_namberが12文字以上だと保存できない' do
        @user.phone_namber = '123456789012'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone namber is invalid. Input only half-width namber")
      end
    end
  end
end
