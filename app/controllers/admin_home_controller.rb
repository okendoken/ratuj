class AdminHomeController < ApplicationController

  layout 'admin'

  before_filter :authenticate_admin!

end
