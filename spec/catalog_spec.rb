require 'spec_helper'

describe Catalog do
  describe '#initialize' do
    it 'creates and instance of Catalog' do
      test_catalog = Catalog.new({ :book_id => 2, :author_id => 1 })
      test_catalog.should be_an_instance_of Catalog
    end
    it 'is initialized with an author id and a book id' do
      test_catalog = Catalog.new({ :book_id => 2, :author_id => 1, :id => 1 })
      test_catalog.book_id.should eq 2
    end
  end

  # describe '.create' do
  #   it 'initializes and saves a new catalog' do
  #     test_catalog = Catalog.create({ :book_id => 2, :author_id => 1 })
  #     test_catalog.book_id.should eq '2'
  #   end
  # end

  describe '#save' do
    it 'saves each instance of catalog' do
      test_catalog = Catalog.new({ :book_id => 2, :author_id => 1 })
      test_catalog.save
      Catalog.all.should eq [test_catalog]
    end
  end

  describe '.all' do
    it 'should be empty to start' do
      Catalog.all.should eq []
    end
  end

  describe '#==' do
    it 'returns true if two catalogs have the same attributes' do
      test_catalog = Catalog.new({ :book_id => 2, :author_id => 1 })
      test_catalog2 = Catalog.new({ :book_id => 2, :author_id => 1 })
      test_catalog.should eq test_catalog2
    end
  end
end
