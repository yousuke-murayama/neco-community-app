class CreateCooperations < ActiveRecord::Migration[5.2]
  def change
    create_table :cooperations do |t|
      t.references :user, foreign_key: true
      t.references :wanted, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :wanted_id], unique: true
    end
  end
end
