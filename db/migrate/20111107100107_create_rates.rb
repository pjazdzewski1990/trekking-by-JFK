class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.float :sum
      t.integer :votes
      t.integer :marker

      t.timestamps
    end
  end
end
