class AddDescriptionToCompulsory < ActiveRecord::Migration
  def change
    add_column :compulsories, :description, :text
  end
end
