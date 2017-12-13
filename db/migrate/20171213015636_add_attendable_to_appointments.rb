class AddAttendableToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_reference :appointments, :attendable, polymorphic: true
  end
end
