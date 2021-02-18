#   bundle exec rspec spec/models/user_spec.rb

require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全て正常の場合' do
        expect(@user).to be_valid
      end
    end
    #----------------------------------------------------------
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      #----------------------------------------------------------
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      #----------------------------------------------------------
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      #----------------------------------------------------------
      it 'emailが@なしでは登録できない' do
        @user.email = '11.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'メールアドレスは不正な値です'
      end
      #----------------------------------------------------------
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字の両方を含めて設定してください')
      end
      #---------------------------------------------------------
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      #---------------------------------------------------------
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字の両方を含めて設定してください')
      end
      #---------------------------------------------------------
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字の両方を含めて設定してください')
      end
      #---------------------------------------------------------
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      #---------------------------------------------------------
      it '性別を選択しないと登録できない' do
        @user.seibetu_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('性別を選んでください')
      end
      #---------------------------------------------------------
      it '職業か学歴を選択しないと登録できない' do
        @user.work_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('職業or学生を選んでください')
      end
      #---------------------------------------------------------
      it '年齢を入力しないと登録できない' do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('年齢を入力してください')
      end
      #---------------------------------------------------------
    end
  end
end
