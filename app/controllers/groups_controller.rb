class GroupsController < ApplicationController
  before_action :require_group, except: %i[visit]

  before_action :require_super, only: %i[index new create]
  before_action :require_admin, only: %i[edit update]
  before_action :require_member, except: %i[show visit]

  before_action :set_group, only: %i[ show edit update destroy visit]

  # GET /groups or /groups.json
  def index
      @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show
    if current_user && current_user.is_super?
      @group = Group.find(params[:id])
    else
      @group = current_group
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    if current_user.is_super?
      @group = Group.find(params[:id])
    else
      @group = current_group
    end

  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.update_group(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      # puts "PPPPPPP #{group_params}"
      if @group.update_group(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def login(user)
    Current.user = user
    reset_session
    session[:group_id] = user.group_id
    session[:user_id] = user.id
    session[:fullname] = user.fullname
    session[:expires] = Time.now + 60.minutes
    Current.group = Current.user.group
  end

  def visit
    if current_user && current_user.is_super?
      session[:group_id] = @group.id
      Current.group = @group
      @who = current_user.fullname
      # render layout: "application"
      # redirect_to root_path, notice:"Click home button to visit"
      # redirect_back(fallback_location: root_path,now:"message")


    else
      Current.group = @group
      user = @group.users.find_by(fullname:'Visitor')
      @who="Visitor"
      unless user.present?
        redirect_to(root_path,alert:"Group does not allow Visitors",data:{turbo:false})
      else
        reset_session
        session[:group_id] = user.group_id
        session[:user_id] = user.id
        session[:fullname] = user.fullname
        session[:expires] = Time.now + 60.minutes
        # redirect_to root_path, notice:"Click home button to visit"
        # render template: 'home/visit'
        # render turbo_stream: turbo_stream.replace('home', template: '/home/visit')
        # render layout: "application"
        # redirect_back(fallback_location: root_path,notice:"message")



      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy!

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def require_group
      cant_do_that(' - Not Authorized') unless current_group.present?
    end

    def require_super
      cant_do_that(' - Not Authorized') unless current_user && current_user.is_super?
    end
    def require_admin
      cant_do_that(' - Not Authorized') unless current_user && current_user.is_admin?
    end
    def require_member
      cant_do_that(' - Not Authorized') unless current_user && current_user.is_member?
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :tees,:courses,@group.default_settings.keys)
    end
end
