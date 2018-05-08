class Book  < ActiveRecord::Base

  def available?
    !UserBook.where(:book => self).where(:returned => 0)
  end

end
