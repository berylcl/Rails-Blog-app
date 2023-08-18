class CorrectPostForeignKeyInComments < ActiveRecord::Migration[7.0]
  def change
    change_table :comments do |t|
      t.remove :post
      t.references :post, foreign_key: { to_table: :posts }
    end
  end
end
