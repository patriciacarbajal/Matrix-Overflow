class AddReferencesAdminToCategories < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.references :admin
    end
  end
end
