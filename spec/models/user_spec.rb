require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }

    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
      it '2文字以上であること' do
        test_user.name = Faker::Lorem.characters(number:1)
        is_expected.to eq false;
      end
      it '20文字以下であること' do
        test_user.name = Faker::Lorem.characters(number:21)
        is_expected.to eq false;
      end
    end
    context 'nick_nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.nick_name = ''
        is_expected.to eq false;
      end
      it '15文字以下であること' do
        test_user.nick_name = Faker::Lorem.characters(number:15)
        is_expected.to eq true;
      end
      it '15文字以下であること' do
        test_user.nick_name = Faker::Lorem.characters(number:16)
        is_expected.to eq false;
      end
    end
    context 'introductionカラム' do
      let(:test_user) { user }
      it '1000文字以下であること' do
        test_user.introduction = Faker::Lorem.characters(number:1001)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:replies).macro).to eq :has_many
      end
    end
  end
end