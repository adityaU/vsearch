class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string :name
      t.string  :city
      t.text :service
      t.integer :base_price
      t.timestamps
    end
  end
end
