class Question < ActiveRecord::Base
  validates_presence_of :content

  has_many :answers #A has_many association indicates a one-to-many connection with another model.
end
