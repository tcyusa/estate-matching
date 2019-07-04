class RemoveMaxSizeToOffers < ActiveRecord::Migration[5.2]
  def change
    remove_column :offers, :max_size, :integer
  end
end
