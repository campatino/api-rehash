module ErrorLibrary

  def internal_server_error
    return {:status => 500, :error => 'Internal Server Error', :message => 'Internal Server Error.'}
  end
  
  def user_not_found
    return {:status => 404, :error => 'Not Found', :message => 'User not found.'}
  end

  def hobby_not_found
    return {:status => 404, :error => 'Not Found', :message => 'Hobby not found.'}
  end

  def book_not_found
    return {:status => 404, :error => 'Not Found', :message => 'Book not found.'}
  end

end