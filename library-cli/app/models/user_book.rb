class UserBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  def overdue?
    Time.now >= Date.parse(self.due_date.to_s)
  end

  def checked_out?
    self.returned == 0 
  end
end