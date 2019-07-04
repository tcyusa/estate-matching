class AddYearsToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :years, :integer
    add_column :offers, :walking_time, :integer
    add_column :offers, :min_size, :integer
    add_column :offers, :max_size, :integer
    add_column :offers, :is_family, :boolean
  end
end
