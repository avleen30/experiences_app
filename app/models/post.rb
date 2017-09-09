class Post < ApplicationRecord

    belongs_to :user
    belongs_to :event

    mount_uploader :attachment, AvatarUploader

    validates :content, presence: true
    validates :user, presence: true
    validates :event, presence: true

  #   auto_html_for :content do
  #   image
  #   youtube(width: 400, height: 250, autoplay: true)
  #   link target: '_blank', rel: 'nofollow'
  #   simple_format
  # end

end
