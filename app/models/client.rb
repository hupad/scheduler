class Client < ApplicationRecord
	has_many :appointments, dependent: :destroy
	has_many :stylists, through: :appointments
end
