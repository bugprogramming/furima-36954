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

      it "パスワードは半角英数混合でなければ登録できない" do
       @user.password = 'cdjsp３２'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
     
      it "お名前（全角）は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = 'taku'
      @user.last_name = 'matsumoto'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角のみで入力して下さい", "First name 全角のみで入力して下さい")
      end

      it "お名前カナ（全角）は全角（カタカナ）でなければ登録できない" do
      @user.first_name_jpn = '拓'
      @user.last_name_jpn = '松本'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name jpn 全角カタカナのみで入力して下さい", "First name jpn 全角カタカナのみで入力して下さい")
      end
      

      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "パスワードは6文字以上でなければ登録できない" do
       @user.password = 'cdjs3'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前（全角）は、first_nameとlast_nameがないと登録できない' do
        @user.first_name = ''
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角のみで入力して下さい", "First name can't be blank", "First name 全角のみで入力して下さい")
      end

      it 'お名前カナ（全角）は、first_name_jpnとlast_name_jpnがないと登録できない' do
        @user.first_name_jpn = ''
        @user.last_name_jpn = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name jpn can't be blank", "Last name jpn 全角カタカナのみで入力して下さい", "First name jpn can't be blank", "First name jpn 全角カタカナのみで入力して下さい")
      end
    end
  end
end
