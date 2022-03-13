class AddSolvedToWanteds < ActiveRecord::Migration[5.2]
  def change
    add_column :wanteds, :solved, :boolean, default: false, null: false
  end
end
