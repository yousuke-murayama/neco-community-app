class CreateTestimonies < ActiveRecord::Migration[5.2]
  def change
    create_table :testimonies do |t|
      t.string :content
      t.string :photo
      t.references :user, foreign_key: true
      t.references :wanted, foreign_key: true

      t.timestamps
    end
  end
end
