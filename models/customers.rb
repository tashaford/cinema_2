require_relative ("../db/sql_runner")

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @funds = options ['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers ;"
    results = SqlRunner.run(sql)
    return results.map { |customer| Customer.new(customer) }
  end

  def update()
    sql = "UPDATE customers SET (name, funds) VALUES ('#{@name}', '#{funds}') WHERE id = #{id} ;"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM customers ;"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = #{@id} ;"
    films = SqlRunner.run(sql)
    return films.map { |film| film['name'] }
  end

end