class AppointmentSerializer < ActiveModel::Serializer
  attributes :client_id, :stylist_id, :start_time, :end_time
end
