class EditSubs < ActiveRecord::Migration
  def change
    remove_index :subs, :moderator_id
    add_index :subs, [:moderator_id, :title], unique: true
  end
end
