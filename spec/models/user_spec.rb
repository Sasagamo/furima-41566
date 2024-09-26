require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    
    it 'ニックネームが必須であること' do
    end

    it 'メールアドレスが必須であること' do
    end

    it 'メールアドレスが一意性であること' do
    end

    it 'メールアドレスは@を含む必要があること' do
    end

    it 'パスワードが必須であること' do
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
    end

    it 'お名前(全角)は名字と名前がそれぞれ必須であること' do
    end

    it 'お名前(全角)は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
    end

    it 'お名前カナ(全角)は名字と名前がそれぞれ必須であること' do
    end

    it 'お名前カナ(全角)は全角（カタカナ）での入力が必須であること' do
    end

    it '生年月日が必須であること' do
    end
  end
end
