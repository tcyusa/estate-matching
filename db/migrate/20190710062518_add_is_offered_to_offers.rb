class AddIsOfferedToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :is_offered, :boolean, default: false
  end
end
