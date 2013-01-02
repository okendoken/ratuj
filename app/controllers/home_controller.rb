class HomeController < ApplicationController
  def index
    @problems = Problem.order("created_at").limit(4)
  end
end
