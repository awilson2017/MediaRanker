class MainController < ApplicationController
  def index
    @spotlight = Work.spotlight
  end
end
