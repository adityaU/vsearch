class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :lawyer_id
      t.text :message
      t.string :name
      t.timestamps
    end
  end
end
