class Appointments < ActiveRecord::Base
  attr_accessible :appointment_time, :name, :paid
  belongs_to :lawyer
end
