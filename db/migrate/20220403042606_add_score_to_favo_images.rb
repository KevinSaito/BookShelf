class AddScoreToFavoImages < ActiveRecord::Migration[6.1]
  def change
    add_column :favo_images, :score, :float
  end
end
