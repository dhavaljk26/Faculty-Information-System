class HomesController < ApplicationController

  def index
  end

  def approve_leaves

    if request.post?
      temp = LeaveApplication.find(params[:al_id])
      temp.approved=true
      temp.save
    end
  end

end
