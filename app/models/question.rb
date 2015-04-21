class Question < ActiveRecord::Base
  after_initialize :set_default, :if => :new_record?

  def set_default
    self.reviewed = false if self.reviewed.nil?
  end
  belongs_to :user
  has_many :answers
end
