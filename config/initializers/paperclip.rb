Paperclip.interpolates :username do |attachment, style|
  # or whatever you've named your User's login/username/etc. attribute
  attachment.instance.name
end