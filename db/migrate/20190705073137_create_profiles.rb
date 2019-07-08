class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.text :pr
      t.string :address
      t.string :business_name
      t.integer :tel

      t.timestamps
    end
  end
end
