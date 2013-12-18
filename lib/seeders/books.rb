module Seeders
  module Books
    class << self
      def seed

        books.each do |name, attributes|
          Book.find_or_initialize_by(title: name) do |book|
            book.title = name
            book.author = attributes.first
            book.rating = attributes.last
            book.save!
          end
        end

      end

      def books
        {"Atlas Shrugged"=>["Ayn Rand", 34],
         "Harry Potter"=>["JK Rowling", 100],
         "Percy Jackson"=>["Rick Riordan", 95],
         "Lolita"=>["Vladimir Nabokov", 89],
         "The Great Gatsby"=>["F. Scott Fitzgerald", 88],
         "Twilight"=>["Stephanie Meyer", 2]
        }
      end


    end
  end

  module Categories
    class << self
      def seed
        categories.each do |name|
          Category.find_or_initialize_by(name: name) do |cat|
            cat.name = name
            cat.save!
          end
        end

      end

      def categories
        ["History",
         "Children",
         "Fiction",
         "Nonfiction",
         "Historical",
         "Fantasy",
         "Science Fiction"
        ]

      end


    end
  end
end
