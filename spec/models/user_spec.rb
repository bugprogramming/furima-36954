require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
     
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'S7z02kjE'
        @user.password_confirmation = 'S7z02kjE'
        expect(@user).to be_valid
      end

      it "passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it 'お名前（全角）は、first_nameとlast_nameがあれば登録できる' do
        @user.first_name = '拓'
        @user.last_name = '松本'
        expect(@user).to be_valid
      end

      it 'お名前カナ（全角）は、first_name_jpnとlast_name_jpnがあれば登録できる' do
        @user.first_name_jpn = 'Taku'
        @user.last_name_jpn = 'Matsumoto'
        expect(@user).to be_valid
      end

    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

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

      it "パスワードは半角英数混合でなければ登録できない"
       @user.password = 'cdjsp３２'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
     
      it "お名前（全角）は全角（漢字・ひらがな・カタカナ）でなければ登録できない"
      @user.first_name = 'taku'
      @user.last_name = 'matsumoto'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name is invalid")
      end

      it "お名前カナ（全角）は全角（カタカナ）でなければ登録できない"
      @user.first_name_jpn = '拓'
      @user.last_name_jpn = '松本'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name is invalid")
      end

      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "email addresses は重複すれば登録できない" do
        duplicate_user = @user.dup
        @user.save
        assert_not duplicate_user.valid?
      end


    end
  end
end
