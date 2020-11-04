class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.text :comment
      t.integer :user_id
      t.integer :post_comment_id

      t.timestamps
    end
  end
end
