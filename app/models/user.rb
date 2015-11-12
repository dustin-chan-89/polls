class User < ActiveRecord::Base
  validates :name, presence: true

  has_many :polls,
    :foreign_key => :author_id,
    :primary_key => :id,
    :class_name => "Poll"

  has_many :responses,
    :foreign_key => :user_id,
    :primary_key => :id,
    :class_name => "Response"
end