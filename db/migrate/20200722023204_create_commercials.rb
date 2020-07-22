class CreateCommercials < ActiveRecord::Migration[6.0]
  def change
    create_table :commercials do |t|
      t.string :title
      t.integer :state_id
      t.string :description

      t.timestamps
    end
  end
end
