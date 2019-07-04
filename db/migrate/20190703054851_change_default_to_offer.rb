class ChangeDefaultToOffer < ActiveRecord::Migration[5.2]
  def change
    change_column :offers, :min_price, :integer, default: 0
    change_column :offers, :max_price, :integer, default: 0
    change_column :offers, :years, :integer, default: 0
    change_column :offers, :walking_time, :integer, default: 0
    change_column :offers, :min_size, :integer, default: 0
    change_column :offers, :max_size, :integer, default: 0
    change_column :offers, :is_family, :boolean, default: false
  end
end
