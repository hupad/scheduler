class StylistSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name

  has_many :appointments
  has_many :clients, through: :appointments
  has_many :schedules
end
