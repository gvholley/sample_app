module UsersHelper

  #Returns the Gravatar

  def avatar_for(user, size: 80)
    size = url_options[:size]
    @user.avatar.attach(params[:avatar])
  end

  def gravatar_for(user, size: 80)
    size = url_options[:size]
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
