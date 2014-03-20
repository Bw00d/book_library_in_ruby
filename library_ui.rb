require 'pg'
require './lib/book'

DB = PG.connect({:dbname => 'library'})
@role = nil

def prompt
  print "> "
end

def role_check
  puts "\n\n"
  puts "Are you a librarian or patron? Enter 'L' for librarian or 'P' for patron:"
  prompt
  @role = gets.chomp.upcase
  puts "\n\n"
  if @role == 'L'
    admin_menu
  elsif @role == 'P'
    patron_menu
  else
    puts "Invalid entry. Try Again"
    role_check
  end
end

def admin_menu
  puts "NB to enter new book to the catalog"
  puts "LB to list all books in the catalog"
  puts "UB to update a book entry in the catalog"
  puts "DB to delete a book from the catalog"
  puts "Search is coming soon!"
  puts "X to exit application."
  prompt
  response = gets.chomp.upcase

  case response
  when 'NB'
    add_book
  when 'LB'
    list_all_books
  when 'UB'
    update_book
  when 'DB'
    delete_book
  when 'X'
    exit
  else
    puts 'invalid entry!'
    admin_menu
  end
end

def add_book
  puts "** Add New Book **\n\n"
  puts 'Enter book title:'
  new_title = gets.chomp
  new_title = title_case(new_title)
  puts 'Enter author:'
  new_author = gets.chomp
  new_author = title_case(new_author)
  Book.create({ :title => new_title, :author => new_author })
  puts "\n\n'#{new_title}' by #{new_author} has been added to the catalog.\n\n"
  admin_menu
end

def list_all_books
  puts "** Catalog **\n\n"
  Book.all.each_with_index do |book, index|
    puts "#{index +1}. #{book.title} by #{book.author}"
  end
  puts "\n\n"
  if @role == 'L' then admin_menu else patron_menu end
end

def update_book
  puts "** Book Editor **"
  puts "\nEnter the title of a book you want to edit:"
  puts "M for main menu"
  response = gets.chomp
  response = title_case(response)
  result = Book.fetch_by_title(response)
  if result == []
    puts "That title is not in the catalog"
    admin_menu
  end
  puts "Enter new title to change or leave blank for no change:"
  new_title = gets.chomp
  new_title = title_case(new_title)
  puts "Enter the author name to change or leave blank for no change:"
  new_author = gets.chomp
  new_author = title_case(new_author)
  if new_author == ""
    new_author = nil
  end
  if new_title == ""
    new_title = nil
  end
  p new_author
  p new_title
  result[0].update({ :title => new_title, :author => new_author })
  puts "#{response} has been updated."
  admin_menu
end

def delete_book
  puts "\n\nEnter the name of a book you want to delete from catalog:"
  to_burn = gets.chomp
  to_burn = title_case(to_burn)
  result = Book.fetch_by_title(to_burn)
  if result == []
    puts "That title is not in the catalog"
    admin_menu
  end
  puts "Are you sure you want to delete #{to_burn}? (y)"
  response = gets.chomp.upcase
  if response == 'Y'
    result[0].burn
    puts "\n\n#{to_burn} was deleted.\n\n"
  else
    puts "\n\nDelete aborted\n\n"
  end
  admin_menu
end

def title_case(string)
    exceptions = ["the", "an", "of", "is", "as", "at", "by", "for", "in", "on", "per", "to", "and", "but", "nor", "or"]
    words = string.downcase.split
    words.each do |word|
      unless exceptions.include?(word)
        word.capitalize!
      end
      words[0].capitalize!
    end
    words.join(" ")
  end

puts "Welcome to your library system."

role_check



