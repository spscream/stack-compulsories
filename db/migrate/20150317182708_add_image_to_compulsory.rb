class AddImageToCompulsory < ActiveRecord::Migration
  def change
    add_column :compulsories, :image, :string
  end
end
