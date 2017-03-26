class Wiki < ActiveRecord::Base
  belongs_to :user
  scope :visible_to, -> (user) { user && user.role != 0 ? all : joins(:wiki).where('wikis.private' => false )}
end
