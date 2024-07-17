class AttendancesController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_warehouse
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def index
    @attendances = @warehouse.attendances
  end

  def show
  end

  def new
    @attendance = @warehouse.attendances.new
  end

  def create
    @attendance = @warehouse.attendances.new(attendance_params.merge(user: current_user))

    if @attendance.save
      redirect_to warehouse_attendance_path(@warehouse, @attendance), notice: 'Attendance was successfully logged.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @attendance.update(attendance_params)
      redirect_to warehouse_attendance_path(@warehouse, @attendance), notice: 'Attendance was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @attendance.destroy
    redirect_to warehouse_attendances_path(@warehouse), notice: 'Attendance was successfully destroyed.'
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:warehouse_id])
  end

  def set_attendance
    @attendance = @warehouse.attendances.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:check_in_time, :check_out_time, :latitude, :longitude)
  end
end
