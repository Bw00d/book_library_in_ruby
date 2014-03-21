class Book

  attr_reader :title, :books, :id

  def initialize(attributes)
    @title  = attributes[:title]
    @id     = attributes[:id]
  end

  def self.create(attributes)
    new_book = Book.new(attributes)
    new_book.save
    new_book
  end

  def self.all
    books = []
    results = DB.exec("SELECT * FROM books;")
    results.each do |result|
      title = result['title']
      id = result['id'].to_i
      books << Book.new({ :title => title, :id => id })
    end
    books
  end

  def self.fetch_by_title(title)
    book = []
    Book.all.each do |obj|
      if obj.title == title
        book << obj
      end
    end
    book
  end

  def save
    results = DB.exec("INSERT INTO books (title) VALUES ('#{@title}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_book)
    self.title == another_book.title && self.id == another_book.id
  end

  def burn
    DB.exec("DELETE FROM books WHERE id = #{self.id};")
  end

  def update(attributes)
    updated= DB.exec("UPDATE books SET author = '#{@author}' WHERE id = #{@id};")
  end

end











