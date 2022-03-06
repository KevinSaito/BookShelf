class CreateFavoComments < ActiveRecord::Migration[6.1]
  def change
    create_table :favo_comments do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.references :favo_image, foreign_key: true

      t.timestamps
    end
  end
end
