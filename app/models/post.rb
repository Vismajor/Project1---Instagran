class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, AvatarUploader
  acts_as_votable
  acts_as_commentable
end
