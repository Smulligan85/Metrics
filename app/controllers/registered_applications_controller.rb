class RegisteredApplicationsController < ApplicationController
  
  def index
    @registered_applications = RegisteredApplication.all
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @user = current_user
    @registered_application = @user.registered_applications.build(app_params)
    if @registered_application.save
      flash[:notice] = "Your Application Has Been Successfully Registered."
      redirect_to @registered_application
    else
      flash[:error] = "There was an error registering your application. Please try again."
      render :new
    end
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "Your Application Is Unregistered."
      redirect_to registered_applications_path
    else
      flash[:error] = "Could not unregister your application. Please try again."
      render :show
    end
  end

  def app_params
    params.require(:registered_application).permit(:name, :url)
  end
end
