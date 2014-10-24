class MentorsController < ApplicationController

  def index
  	@sheets = Sheet.where(user_id: current_user).order("sheets.date ASC")
  	@sheet = Sheet.new
  end

  def create
  	@newsheet = current_user.sheets.build(sheet_params)
        
      	if @newsheet.save(sheet_params)
          redirect_to :back

  
        else
          flash[:alert] = "Sheet was not created successfully."
          redirect_to :back
        end
  

  end

  def update
  end

  def destroy
  	if
      sheet = Sheet.find(params[:id]).destroy
      redirect_to :back
     	authorize! :destroy, sheet
    else
      flash[:notice] = "The sheet could not be deleted."
      redirect_to :back
    end
  end

  def create_slots
  	@newslot = Slot.create(slot_params)
        
      	if @newslot.save(slot_params)
          redirect_to :back
  
        else
          flash[:alert] = "The slot was not created successfully. Please verify that all fields were filled in."
          redirect_to :back
        end
  end

  def destroy_slots
    if
      slot = Slot.find(params[:id]).destroy
      redirect_to :back
     	authorize! :destroy, slot
    else
      flash[:notice] = "The slot could not be deleted."
      redirect_to :back
    end
  end

  def update_slots
    if
      slot = Slot.find(params[:id]).update_attributes(:user_id => current_user.id)
      redirect_to :back
    else
      flash[:notice] = "The slot could not be updated."
      redirect_to :back
    end
  end

  def release_slots
    if
      slot = Slot.find(params[:id]).update_attributes(:user_id => nil)
      redirect_to :back
    else
      flash[:notice] = "The slot could not be released."
      redirect_to :back
    end
  end


  private

    def sheet_params
      params.require(:sheet).permit(:user_id, :date, :description)
    end
    def slot_params
      params.require(:slot).permit(:sheet_id, :start_time, :end_time)
    end
    def mentee_params
      params.require(:slot).permit(:user_id)
    end

end
