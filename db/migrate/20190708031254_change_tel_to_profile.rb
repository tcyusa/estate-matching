class ChangeTelToProfile < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :tel, :string
  end
end
