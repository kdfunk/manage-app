class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_manage
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET manages/1/tasks
  def index
    @tasks = @manage.tasks
  end

  # GET manages/1/tasks/1
  def show
  end

  # GET manages/1/tasks/new
  def new
    @task = @manage.tasks.build
  end

  # GET manages/1/tasks/1/edit
  def edit
  end

  # POST manages/1/tasks
  def create
    @task = @manage.tasks.build(task_params)

    if @task.save
      redirect_to(@task.manage)
    else
      render action: 'new'
    end
  end

  # PUT manages/1/tasks/1
  def update
    if @task.update_attributes(task_params)
      redirect_to(@task.manage, notice: 'Task was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE manages/1/tasks/1
  def destroy
    @task.destroy

    redirect_to manage_url(@manage)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage
      @manage = current_user.manages.find(params[:manage_id])
    end

    def set_task
      @task = @manage.tasks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :description, :status, :manage, :references)
    end
end
