class InterestedUser < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /@/
end
