module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username)

  end

  def current_user # return the details of the logged in user
   @current_user ||= User.find(session[:user_id]) if session[:user_id] # give us user object from the users table, then we can access whatever information we need. referemcers current_users
  
  end

  def logged_in? # check if user is logged in
    !!current_user # turns current_user into boolean. returns True or False
    
  end

end
