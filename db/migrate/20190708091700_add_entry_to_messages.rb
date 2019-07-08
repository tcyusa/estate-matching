class AddEntryToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :entry, foreign_key: true
  end
end
