class MentorsController < ApplicationController



  def index
  	@sheets = Sheet.where(user_id: current_user).order("sheets.date ASC")
  	@sheet = Sheet.new
    authorize! :create, @sheet

  end

  def create
  	@newsheet = current_user.sheets.build(sheet_params)
        authorize! :create, @newsheet

      	if @newsheet.save(sheet_params)
          redirect_to :back


        else
          flash[:alert] = "Sheet was not created successfully."
          redirect_to :back
        end


<<<<<<< HEAD
  end
=======

>>>>>>> 063e5da19450a75e5dbb714d4d0eb55fd3d34fb8



  def destroy
    sheet = Sheet.find(params[:id])
    authorize! :destroy, sheet
  	if
      sheet.destroy
      redirect_to :back
    else
      flash[:notice] = "The sheet could not be deleted."
      redirect_to :back
    end
  end

  def create_slots
    authorize! :create, Slot

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
     	authorize! :destroy, Slot
    else
      flash[:notice] = "The slot could not be deleted."
      redirect_to :back
    end
  end

  def update_slots
    if
      slot = Slot.find(params[:id])
      authorize! :update, slot
      slot.update_attributes(:user_id => current_user.id)
      redirect_to :back
    else
      flash[:notice] = "The slot could not be updated."
      redirect_to :back
    end
  end

<<<<<<< HEAD
  # def release_slots
  #   if slot = Slot.find(params[:id]).
  #     authorize! :update, slot
  #     slot.update_attributes(:user_id => nil)
  #     redirect_to :back
  #   else
  #     flash[:notice] = "The slot could not be released."
  #     redirect_to :back
  #   end
  # end
=======
  def release_slots
    if
      slot = Slot.find(params[:id]).
      authorize! :update, slot
      slot.update_attributes(:user_id => nil)
      redirect_to :back
    else
      flash[:notice] = "The slot could not be released."
      redirect_to :back
    end
  end
>>>>>>> 063e5da19450a75e5dbb714d4d0eb55fd3d34fb8


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
