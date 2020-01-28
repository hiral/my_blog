class UsersController < ApplicationController
  # Callbacks
  skip_before_action :verify_authenticity_token, only: [:get_states_from_country]
  before_action :set_User, only: [:edit, :update, :destroy]
  before_action :get_country, only: [:new, :create, :edit, :update]
  before_action :get_state, only: [:new, :create, :edit, :update] 
  before_action :get_city, only: [:new, :create, :edit, :update] 

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save 
  	    format.html { redirect_to users_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end  
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
          format.html { redirect_to users_path, notice: 'User was successfully deleted.' }
      end
    end
  end

  def get_states_from_country
    raise params.inspect
  end

  private
    def set_User
      @user = User.find_by_id(params[:id])
    end

    def get_country
      @countries = Country.all
    end

    def get_state
      @states =  State.all
    end

    def get_city
      @cities = City.all
    end

	  def user_params
	    params.require(:user).permit(:name, :birth_date, :contact_number, :email, :aadhar_number, :parmenent_address, :local_address, :terms_condition, :country_id, :state_id, :city_id)
	  end	
end
