class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, :through => :user_books

  def checkout(book)
    ub = UserBook.new(:user => self, :book => book)
    ub.returned = 0
    ub.due_date = Time.now+2.weeks
    ub.save
    ub
  end

  def current_books
    self.user_books.where(:returned => 0).collect{|ub| ub.book}
  end

end


# u = User.first
# b = Book.first

# u.checkout(b) # WHAT HAPPENED?
# A new user book was created
# it should belong to the first user and the first book
# it should have a due date, 2 weeks from today
# and it should not be returned

