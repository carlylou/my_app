class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.text :body
      # this line adds an integer column called `article_id`.
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
