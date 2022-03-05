class CreateFavoImages < ActiveRecord::Migration[6.1]
  def change
    create_table :favo_images do |t|
      t.string :location
      t.text :caption
      t.references :user, foreign_key: true
      

      t.timestamps
    end
  end
end
