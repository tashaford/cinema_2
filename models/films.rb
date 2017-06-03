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
    sql = " SELECT * FROM"
  end



end