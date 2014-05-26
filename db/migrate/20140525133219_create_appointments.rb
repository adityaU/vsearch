class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :lawyer_id
      t.timestamps :appointment_time
      t.string :name
      t.boolean :paid
      t.timestamps
    end
  end
end
