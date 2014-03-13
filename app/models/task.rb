class Task < ActiveRecord::Base
  attr_accessible :text, :completed, :user_id
end
