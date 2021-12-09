class AddDetailsToWanteds < ActiveRecord::Migration[5.2]
  def change
    add_column :wanteds, :address, :string
    add_column :wanteds, :latitude, :float
    add_column :wanteds, :longitude, :float
  end
end
