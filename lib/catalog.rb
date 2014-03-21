class Catalog

  attr_reader :id, :book_id, :author_id

  def initialize(attributes)
    @id        = attributes[:id]
    @book_id   = attributes[:book_id]
    @author_id = attributes[:author_id]
  end

  def save
    results = DB.exec("INSERT INTO catalog (author_id, book_id) VALUES ('#{@author_id}', '#{@book_id}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    catalog = []
    results = DB.exec("SELECT * FROM catalog;")
    results.each do |result|
      book_id = result['book_id'].to_i
      author_id = result['author_id'].to_i
      id = result['id'].to_i
      catalog << Catalog.new({ :author_id => author_id, :book_id => book_id, :id => id })
    end
    catalog
  end

  def ==(another_catalog)
    self.author_id == another_catalog.author_id && self.id == another_catalog.id && self.book_id == another_catalog.book_id
  end

end
