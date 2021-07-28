# Class similar a ApplicationController to handle the services classes with a method called call
# that creates a new instance of the class with the arguments or block you pass to it, and calls
# call on the instance.

# To more information, see the article of the Amin Shah at this link: https://www.toptal.com/ruby-on-rails/rails-service-objects-tutorial
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
