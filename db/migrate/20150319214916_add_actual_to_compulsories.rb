class AddActualToCompulsories < ActiveRecord::Migration
  def change
    add_column :compulsories, :actual, :boolean, default: false
  end
end
