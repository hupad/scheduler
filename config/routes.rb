Rails.application.routes.draw do
  
	post 'reply', to: 'messages#reply'
	
	#Stylist
	post 'stylist', to: 'stylists#create'
	get 'stylist/:id', to: 'stylists#show'
	put 'stylist/:id', to: 'stylists#update'

	# Scheduling
	get 'stylist/:id/schedule', to: 'schedule#index'
	post 'stylist/:id/schedule', to: 'schedule#create'
	get 'stylist/:id/schedule/:schedule_id', to: 'schedule#show'
	put 'stylist/:id/schedule/:schedule_id', to: 'schedule#update'
	delete 'stylist/:id/schedule/:schedule_id', to: 'schedule#delete'

	# Appointments
	post 'stylist/:id/appointment', to: 'stylist_appointments#create'
	get 'stylist/:id/appointment', to: 'stylist_appointments#index'

end