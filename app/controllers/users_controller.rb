class UsersController < ApplicationController
  # before_action :require_super, only: %i[index]
  before_action :require_admin, only: %i[index show edit update destroy ]
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    if current_user.is_super?
      @users = User.all.order(:fullname)
    else
      @users = current_group.users.where.not(role:'super')
    end
  end

  # def index
  #   roles = User::Roles
  #   puts "ROLES #{roles}"
  #   role = Can.level(current_user.role)
  #   excluds = []
  #   if current_user.is_super?
  #     excluds << current_user
  #     @users = User.all.order(:fullname)
  #   elsif current_user.role = 1
  #     excluds << current_user
  #     @users = User.where(role:roles[1..-1]).excluding(excludes).order(:fullname)
  #   elsif role == 2
  #     @users = current_group.users.excluding(excludes).order(:fullname)
  #   else
  #     @users = User.all.order(:fullname)
  #   end
  #   # @users = User.where(role:roles[2..-1]).order(:fullname)

  # end


  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = current_group.users.new(role:'guest')
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.permits = DefaultPermits::CRUD[@user.role.to_sym]
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    curr_role = @user.role
    # puts "CURR ROLE #{curr_role}"
    respond_to do |format|
      if @user.update(user_params)
        # puts "CURR ROLE #{curr_role} NEW ROLE #{@user.role} #{@user.role != curr_role}"
        if @user.role.nil? || @user.permits.blank? || (@user.role != curr_role) # role changed - may be a better way
          @user.permits = DefaultPermits::CRUD[@user.role.to_sym]
          @user.save
        end
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def require_super
      cant_do_that(' - Not Authorized') unless is_super?
    end
    def require_admin
      cant_do_that(' - Not Authorized') unless current_user && current_user.is_admin?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if is_super?
        @user = User.find(params[:id])
      else
        @user = current_group.users.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:group_id, :fullname, :username, :email, :role, :permits, :password, :password_confirmation)
    end
end
