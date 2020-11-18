require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        post.title = ''
        expect(post.valid?).to eq false;
      end
      it '50文字以下であること' do
        post.title = Faker::Lorem.characters(number:51)
        expect(post.valid?).to eq false;
      end
    end
    context 'subtitleカラム' do
      it '空欄でないこと' do
        post.subtitle = ''
        expect(post.valid?).to eq false;
      end
      it '80文字以下であること' do
        post.subtitle = Faker::Lorem.characters(number:81)
        expect(post.valid?).to eq false;
      end
    end
    context 'post_imageカラム' do
      it '空欄でないこと' do
        post.post_image = ''
        expect(post.valid?).to eq false;
      end
    end
    context 'bodyカラム' do
      it '空欄でないこと' do
        post.body = ''
        expect(post.valid?).to eq false;
      end
      it '20文字以上であること' do
        post.body = Faker::Lorem.characters(number:19)
        expect(post.valid?).to eq false;
      end
    end
    context 'portfolio_urlカラム' do
      it '200文字以下であること' do
        post.portfolio_url = Faker::Lorem.characters(number:201)
        expect(post.valid?).to eq false;
      end
    end
    context 'source_code_urlカラム' do
      it '200文字以下であること' do
        post.source_code_url = Faker::Lorem.characters(number:201)
        expect(post.valid?).to eq false;
      end
    end
    context 'messageカラム' do
    it '200文字以下であること' do
      post.message = Faker::Lorem.characters(number:201)
      expect(post.valid?).to eq false;
    end
  end
    context 'development_environment_textカラム' do
    it '200文字以下であること' do
      post.development_environment_text = Faker::Lorem.characters(number:201)
      expect(post.valid?).to eq false;
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Post_commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'Post_commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end