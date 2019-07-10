class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :estate_user, foreign_key: { to_table: :users }
      t.references :normal_user, foreign_key: { to_table: :users }

      t.timestamps
      
      t.index [:estate_user_id, :estate_user_id], unique: true
    end
  end
end
