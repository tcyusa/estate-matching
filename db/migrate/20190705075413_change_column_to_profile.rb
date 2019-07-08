class ChangeColumnToProfile < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :tel, :integer, default: 0
  end
end
