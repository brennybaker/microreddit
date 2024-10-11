class CreateFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :follows do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :followed_user

      t.timestamps
    end
  end
end
