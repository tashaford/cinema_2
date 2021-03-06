require_relative ("../db/sql_runner")

class Ticket
  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES (#{@customer_id}, #{@film_id}) RETURNING * ;"
    result = SqlRunner.run(sql) 
    @id = result[0]['id']
  end

  def self.all()
    sql = "SELECT * FROM tickets;"
    result = SqlRunner.run(sql)
    return result.map { |ticket| Ticket.new(ticket) }
  end

  def update()
    sql ="UPDATE tickets SET (customer_id, film_id) VALUES (#{@customer_id}, #{@film_id}) WHERE id = #{id} ;"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets ;"
    SqlRunner.run(sql)
  end


end