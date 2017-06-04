require_relative ('../models/customers')
require_relative ('../models/films')
require_relative ('../models/tickets')

require ('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({'name' => 'Natasha', 'funds' => 30})
customer1.save()
customer2 = Customer.new({'name' => 'Ashton', 'funds' => 15})
customer2.save()
customer3 = Customer.new({'name' => 'Sean', 'funds' => 10})
customer3.save()
customer4 = Customer.new({'name' => 'Euan', 'funds' => 45})
customer4.save()

film1 = Film.new({'title' => 'Guardians of the Galaxy 2', 'ticket_price' => 4})
film1.save()
film2 = Film.new({'title' => 'Baywatch', 'ticket-price' => 6})
film2.save()
film3 = Film.new({'title' => 'Logan', 'ticket-price' => 6})
film3.save()

ticket1 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film2.id})
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id})
ticket5.save()
ticket6 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film3.id})
ticket6.save()
ticket7 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket7.save()
ticket8 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film1.id})
ticket8.save()

customer1.buy_ticket(film1.ticket_price)
customer1.buy_ticket(film2.ticket_price)
customer1.buy_ticket(film3.ticket_price)

customer2.buy_ticket(film1.ticket_price)

customer3.buy_ticket(film1.ticket_price)

customer4.buy_ticket(film1.ticket_price)
customer4.buy_ticket(film2.ticket_price)
customer4.buy_ticket(film3.ticket_price)

Customer.all()
Film.all()
Ticket.all()


binding.pry
nil