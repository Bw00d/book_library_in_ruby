class Author

attr_reader :name, :id

  def initialize(attributes)
    @name  = attributes[:name]
    @id     = attributes[:id]
  end

  def self.create(attributes)
    new_author = Author.new(attributes)
    new_author.save
    new_author
  end

  def save
    results = DB.exec("INSERT INTO authors (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    authors = []
    results = DB.exec("SELECT * FROM authors;")
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      authors << Author.new({ :name => name, :id => id })
    end
    authors
  end

  def ==(another_author)
    self.name == another_author.name && self.id == another_author.id
  end

  def kill
    DB.exec("DELETE FROM authors WHERE id = #{self.id};")
  end

  def update(attributes)
    if attributes[:name].nil? then @name = @name else @name = attributes[:name] end
    @title = if attributes[:title].nil? then @title else attributes[:title] end
    updated_book = DB.exec("UPDATE authors SET name = '#{@name}' WHERE id = #{@id};")
  end

  def self.fetch_by_author(name)
    authors = []
    Author.all.each do |author|
      if author.name == name
        authors << author
      end
    end
    authors
  end

end
