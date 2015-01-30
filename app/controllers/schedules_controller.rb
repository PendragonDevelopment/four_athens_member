class SchedulesController < ApplicationController
before_action :authenticate_user!

  def index
  	authorize! :read, Slot
  	@sheets = Sheet.where("date >= ?", Time.now.strftime("%m/%d/%Y")).order("sheets.date ASC")
  	@slots = Slot.joins(:sheet).where("slots.user_id = ?", current_user.id).where(".sheets.date >= ?", Time.now.strftime("%m/%d/%Y")).order("sheets.date ASC")
  end

  def test
  end
end
