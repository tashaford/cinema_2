require_relative ('../models/customers')
require_relative ('../models/films')
require_relative ('../models/tickets')

require ('pry-byebug')

customer1 = Customer.new({
  'name' => 'Natasha',
  'funds' => 20})
customer1.save()
customer2 = Customer.new({
  'name' => 'Colin',
  'fund' => 15})
customer2.save()

film1 = Film.new({
  'title' => 'movie',
  'ticket_price' => 4})
film1.save()
film2 = Film.new({
  'title' => 'film',
  'ticekt-price' => 6})
film2.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })
ticket1.save()

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id
  })