class CreateUserCityRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_city_relations do |t|
      t.references :offer, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
      
      t.index [:offer_id, :city_id], unique: true
    end
  end
end
