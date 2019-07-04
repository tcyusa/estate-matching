class RenameUserCityRelationToOfferCityRelation < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_city_relations, :offer_city_relations
  end
end
