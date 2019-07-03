class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: true
      t.integer :min_price, :default => 0
      t.integer :max_price, :default => 0

      t.timestamps
    end
  end
end
