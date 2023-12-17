class ManagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_manage, only: %i[ show edit update destroy ]

  # GET /manages or /manages.json
  def index
    @manages = current_user.manages
  end

  # GET /manages/1 or /manages/1.json
  def show
    @task = @manage.tasks.build
  end

  # GET /manages/new
  def new
    @manage = current_user.manages.build
  end

  # GET /manages/1/edit
  def edit
  end

  # POST /manages or /manages.json
  def create
    @manage = current_user.manages.build(manage_params)

    respond_to do |format|
      if @manage.save
        format.html { redirect_to manage_url(@manage), notice: "Manage was successfully created." }
        format.json { render :show, status: :created, location: @manage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @manage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manages/1 or /manages/1.json
  def update
    respond_to do |format|
      if @manage.update(manage_params)
        format.html { redirect_to manage_url(@manage), notice: "Manage was successfully updated." }
        format.json { render :show, status: :ok, location: @manage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @manage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manages/1 or /manages/1.json
  def destroy
    @manage.destroy!

    respond_to do |format|
      format.html { redirect_to manages_url, notice: "Manage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_manage
    @manage = current_user.manages.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Manage record not found"
  end

  # Only allow a list of trusted parameters through.
  def manage_params
    params.require(:manage).permit(:name, :description, :status)
  end
end