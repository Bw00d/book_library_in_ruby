require 'spec_helper'

describe Author do
  describe '#initialize' do
    it 'creates and instance of author' do
      test_author = Author.new({ :name => "Henry Miller" })
      test_author.should be_an_instance_of Author
    end
    it 'is initialized with an author' do
      test_author = Author.new({ :name => "Henry Miller", :id => 1 })
      test_author.name.should eq 'Henry Miller'
    end
  end

  describe '.create' do
    it 'initializes and saves a new author' do
      test_author = Author.create({ :name => "Henry Miller" })
      test_author.name.should eq 'Henry Miller'
    end
  end

  describe '#save' do
    it 'saves each instance of author' do
      test_author = Author.new({ :name => "Henry Miller" })
      test_author.save
      Author.all.should eq [test_author]
    end
  end

  describe '.all' do
    it 'should be empty to start' do
      Author.all.should eq []
    end
  end

  describe '#==' do
    it 'returns true if two authors have the same attributes' do
      test_author = Author.new({ :name => "Henry Miller" })
      test_author2 = Author.new({ :name => "Henry Miller" })
      test_author.should eq test_author2
    end
  end

  describe '#kill' do
    it 'destroys an instance author' do
      test_author = Author.create({ :name => "Henry Miller" })
      test_author.kill
      Author.all.should eq []
    end
  end

  describe '.fetch_by_author' do
    it 'returns the author that matches the title entered' do
      test_author = Author.create({ :name => 'Henry Miller'})
      Author.fetch_by_author('Henry Miller').should eq [test_author]
    end
  end

  describe 'update' do
    it 'should update a authors attributes' do
      test_author = Author.create({ :name => "henry Miller" })
      test_author.update({ :name => 'Henry Miller'})
      test_author.name.should eq 'Henry Miller'
    end
  end
end
