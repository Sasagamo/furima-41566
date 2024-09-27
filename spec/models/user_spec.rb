require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは@を含む必要があること' do
        @user.email = 'testemail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは6文字以上であること' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは半角英数字混合であること' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password_confirmation = 'different_password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)は名字と名前がそれぞれ必須であること' do
        @user.first_name = ''
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank")
      end

      it 'お名前(全角)は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'abc'
        @user.last_name = 'def'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters',
                                                      'Last name is invalid. Input full-width characters')
      end

      it 'お名前カナ(全角)は名字と名前がそれぞれ必須であること' do
        @user.first_name_kana = ''
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "Last name kana can't be blank")
      end

      it 'お名前カナ(全角)は全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = 'やまだ'
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters',
                                                      'Last name kana is invalid. Input full-width katakana characters')
      end

      it '生年月日が必須であること' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
