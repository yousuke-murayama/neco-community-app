class AddContentToWanteds < ActiveRecord::Migration[5.2]
  def change
    add_column :wanteds, :content, :string
  end
end
