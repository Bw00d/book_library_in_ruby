require 'spec_helper'

describe Book do
  describe '#initialize' do
    it 'creates and instance of Book' do
      test_book = Book.new({ :title => 'Black Spring' ,:author => 'Henry Miller' })
      test_book.should be_an_instance_of Book
    end
    it 'is initialized with a title and author' do
      test_book = Book.new({ :title => 'Black Spring' ,:author => 'Henry Miller', :id => 1 })
      test_book.title.should eq 'Black Spring'
    end
  end

  describe '.create' do
    it 'initializes and saves a new book' do
      test_book = Book.create({ :title => 'Black Spring' ,:author => 'Henry Miller'})
      test_book.title.should eq 'Black Spring'
    end
  end

  describe '#burn' do
    it 'destroys an instance book' do
      test_book = Book.create({ :title => 'Black Spring' ,:author => 'Henry Miller'})
      test_book.burn
      Book.all.should eq []
    end
  end

  describe '.all' do
    it 'should be empty to start' do
      Book.all.should eq []
    end
  end

  describe '.fetch_by_title' do
    it 'returns the book that matches the title entered' do
      test_book = Book.create({ :title => 'Sexxus' ,:author => 'Henry Miller'})
      Book.fetch_by_title('Sexxus').should eq [test_book]
    end
  end

  describe '.fetch_by_author' do
    it 'returns the book that matches the title entered' do
      test_book = Book.create({ :title => 'Sexxus' ,:author => 'Henry Miller'})
      Book.fetch_by_author('Henry Miller').should eq [test_book]
    end
  end

  describe '#save' do
    it 'saves each instance of book' do
      test_book = Book.new({ :title => 'Black Spring' ,:author => 'Henry Miller' })
      test_book.save
      Book.all.should eq [test_book]
    end
  end

  describe '#==' do
    it 'returns true if two books have the same attributes' do
      test_book = Book.new({ :title => 'Black Spring' ,:author => 'Henry Miller' })
      test_book2 = Book.new({ :title => 'Black Spring' ,:author => 'Henry Miller' })
      test_book.should eq test_book2
    end
  end

  describe 'update' do
    it 'should update a books attributes' do
      test_book = Book.create({ :title => 'Black Spring' ,:author => 'henry Miller' })
      test_book.update({ :author => 'Henry Miller'})
      test_book.author.should eq 'Henry Miller'
    end
  end
end
