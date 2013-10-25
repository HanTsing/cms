class RolesController < ApplicationController
  
  def index
    @roles = Role.page(params[:page])
  end

  def new
    @role = Role.new
  end

  def show
    @role = Role.find params[:id]
  end

  def edit
    @role = Role.find params[:id]
  end

  def create
    @role = Role.new(params[:role])

    if @role.save
      flash[:success] = t("list.success")
      redirect_to role_url(@role)
    else
      render :action => "new"
    end
  end

  def update
    @role = Role.find params[:id]
    if @role.update_attributes(params[:role])
      flash[:success] = t("role.success")
      redirect_to role_url(@role)
    else
      render edit_role_url(@role)
    end
  end

end
