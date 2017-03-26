class Wiki < ActiveRecord::Base
  belongs_to :user
  scope :visible_to, -> (user) { user && user.role != 'standard' ? all : where(private: false )}
end
