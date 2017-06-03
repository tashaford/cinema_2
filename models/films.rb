require_relative ("../db/sql_runner")

class Film
  attr_reader :id
  attr_accessor :title, :ticket_price

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @title = options['title']
    @ticket_price = options['ticket_price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, ticket_price) VALUES ('#{@title}', #{@ticket_price}) RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = " SELECT * FROM films ;"
    result = SqlRunner.run(sql)
    return result.map { |film| Film.new(film) }
  end

  def update()
    sql = "UPDATE films SET (title, ticket_price) VALUES ('#{@title}', '#{@ticket_price}') WHERE id = #{id} ;"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM films ;"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE tickets.film_id = #{@id} ; "
    result = SqlRunner.run(sql)
    return result.map { |customer| customer['name'] }
  end

end