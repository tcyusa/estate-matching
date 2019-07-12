class RenameBusinessNameToProfiles < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :business_name, :representative_name
  end
end
