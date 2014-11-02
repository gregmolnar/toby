class PasswordsController < ApplicationController
  load_and_authorize_resource
  before_action :find_password, except: [:create, :new, :index, :verify]
  helper DeviseHelper
  def index
    @passwords = current_user.passwords.all
  end

  def create
    @password = current_user.passwords.new(password_params)

    respond_to do |format|
      if @password.save
        format.html { redirect_to edit_password_path(@password), notice: 'password was successfully created.' }
        format.json { render :show, status: :created, location: @password }
      else
        format.html { render :new }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def verify
    if current_user.valid_password?(params[:password])
      render json: "Ok"
    else
      render json: "Nope", status: :unauthorized
    end
  end

  def destroy
    @password.destroy
    redirect_to passwords_path
  end

  private

  def find_password
    @password = current_user.passwords.find(params[:id])
  end
  def password_params
    params.require(:password).permit(:title, :username, :password, :url, :comment)
  end
end
