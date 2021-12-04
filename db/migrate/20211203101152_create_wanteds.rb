class CreateWanteds < ActiveRecord::Migration[5.2]
  def change
    create_table :wanteds do |t|
      t.string :title
      t.string :image
      t.string :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
