class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title, null: false
      t.text :subtitle, null: false
      t.string :post_image, null: false
      t.text :portfolio_url
      t.string :source_code_url
      t.text :body, null: false
      t.string :message
      t.text :development_environment_text

      t.timestamps
    end
  end
end
