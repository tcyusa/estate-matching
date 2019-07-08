class CreateProfileCityRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_city_relations do |t|
      t.references :profile, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
      
      t.index [:profile_id, :city_id], unique: true
    end
  end
end
