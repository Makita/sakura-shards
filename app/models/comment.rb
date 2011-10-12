class Comment < ActiveRecord::Base
  belongs_to :announcement
end
