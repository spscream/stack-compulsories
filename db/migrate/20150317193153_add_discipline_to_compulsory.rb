class AddDisciplineToCompulsory < ActiveRecord::Migration
  def change
      add_column :compulsories, :discipline, :integer, default: 0
  end
end
