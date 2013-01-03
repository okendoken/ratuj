class AdminHomeController < ApplicationController

  layout 'admin'

  before_filter :authenticate_admin!

  def report
    @payments = Payment.all
    render :layout => 'print'
  end

end
