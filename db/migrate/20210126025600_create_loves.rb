class CreateLoves < ActiveRecord::Migration[6.0]
  def change
    create_table :loves do |t|
      ## タイトル
      t.string :title,              null: false, default: ""
      ## 悩みの説明
      t.text :info1,                null: false
      ## ユーザー管理テーブルとのアソシエーション
      t.references :user, foreign_key: true
      ## 投稿時間
      t.timestamps
    end
  end
end
