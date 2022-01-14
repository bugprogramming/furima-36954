require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
     
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user).to be_valid
      end

      it "passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it "@がなければ登録できない" do
        @user.email = '217683t69icloud.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
     
    end
  end
end
