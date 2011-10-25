class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :name
      t.float :posX
      t.float :posY
      t.string :url

      t.timestamps
    end
  end
end
