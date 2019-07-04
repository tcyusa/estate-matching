class CreateOfferChoiceRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_choice_relations do |t|
      t.references :offer, foreign_key: true
      t.references :choice, foreign_key: true

      t.timestamps
      
      t.index [:offer_id, :choice_id], unique: true
    end
  end
end
