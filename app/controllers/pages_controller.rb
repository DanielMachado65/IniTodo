class PagesController < ApplicationController
  def about
    @title = 'About'
    @content = 'this is the about page'
  end
end
