class CreateDateOfNextPassovers < ActiveRecord::Migration[5.0]
  def change
    create_table :date_of_next_passovers do |t|
      t.integer :timestamp
      t.string :timezone

      t.timestamps
    end
  end
end
