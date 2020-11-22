class EventAttendancesController < ApplicationController
    # GET /event_attendances
  # GET /event_attendances.json
  def index
    @event_attendances = EventAttendance.all
  end

  # GET /event_attendances/1
  # GET /event_attendances/1.json
  def show
  end

  # GET /event_attendances/new
  def new
    @event_attendance = EventAttendance.new
  end

  # GET /event_attendances/1/edit
  def edit
  end

  # POST /event_attendances
  # POST /event_attendances.json
  def create
    @event_attendance = EventAttendance.create(event_attendance_params)
  end

  # PATCH/PUT /event_attendances/1
  # PATCH/PUT /event_attendances/1.json
  def update
    respond_to do |format|
      if @event_attendance.update(event_attendance_params)
        format.html { redirect_to @event_attendance, notice: 'Event attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_attendance }
      else
        format.html { render :edit }
        format.json { render json: @event_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_attendances/1
  # DELETE /event_attendances/1.json
  def destroy
    @event_attendance.destroy
    respond_to do |format|
      format.html { redirect_to event_attendances_url, notice: 'Event attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_attendance
      @event_attendance = EventAttendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_attendance_params
      params.require(:event_attendance).permit(:attendee_id, :event_attended_id)
    end
end
