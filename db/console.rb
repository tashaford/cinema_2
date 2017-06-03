require_relative ('../models/customers')
require_relative ('../models/films')
require_relative ('../models/tickets')

require ('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({
  'name' => 'Natasha',
  'funds' => 20})
customer1.save()
customer2 = Customer.new({
  'name' => 'Ashton',
  'funds' => 15})
customer2.save()
customer3 = Customer.new({
  'name' => 'Sean',
  'funds' => 10})
customer3.save()
customer4 = Customer.new({
  'name' => 'Euan',
  'funds' => 45})
customer4.save()

film1 = Film.new({
  'title' => 'movie',
  'ticket_price' => 4})
film1.save()
film2 = Film.new({
  'title' => 'film',
  'ticekt-price' => 6})
film2.save()

ticket1 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id
  })
ticket1.save()
ticket2 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })
ticket2.save()
ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film2.id
  })
ticket3.save()
ticket4 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film1.id
  })
ticket4.save()




binding.pry
nil