class HobbiesController < ApplicationController
  include ErrorLibrary
  before_action :set_hobby, only: [:show, :update, :destroy]

  # GET /hobbies
  def index
    user = User.find(params[:user_id])
    render json: {:user => user.name, :hobbies => HobbyBlueprint.render_as_json(user.hobbies)}
  rescue ActiveRecord::RecordNotFound
    render json: user_not_found, :status => 404
  end

  # GET /hobbies/1
  def show
    render json: @hobby
  end

  # POST /hobbies
  def create
    @hobby = Hobby.new(hobby_params)

    if @hobby.save
      render json: @hobby, status: :created, location: @hobby
    else
      render json: @hobby.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hobbies/1
  def update
    if @hobby.update(hobby_params)
      render json: @hobby
    else
      render json: @hobby.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hobbies/1
  def destroy
    @hobby.destroy
  end

  def all
    render json: Hobby.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hobby
      @hobby = Hobby.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: hobby_not_found, :status => 404
    rescue
      render json: internal_server_error, :status => 500
    end

    # Only allow a list of trusted parameters through.
    def hobby_params
      params.require(:hobby).permit(:user_id, :name)
    end
end
