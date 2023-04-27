class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.references :user1, null: false, foreign_key: {to_table: :users}, index: true
      t.references :user2, null: false, foreign_key: {to_table: :users}, index:true

      t.timestamps
    end
  end
end
