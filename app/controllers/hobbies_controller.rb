class HobbiesController < ApplicationController
  before_action :set_hobby, only: [:update, :destroy]

  # GET /hobbies
  def index
    @hobbies = Hobby.all

    render json: @hobbies
  end

  # GET /hobbies/1
  def show
    user = User.find(params[:id])
    render json: {:user => user.name, :hobbies => HobbyBlueprint.render_as_json(user.hobbies)}
  rescue ActiveRecord::RecordNotFound
    render json: {:status => 404, :error => 'Not Found', :message => 'User not found.'}, :status => 404
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hobby
      @hobby = Hobby.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {:status => 404, :error => 'Not Found', :message => 'Hobby not found.'}, :status => 404
    rescue
      render json: {:status => 500, :error => 'Internal Server Error', :message => 'Internal Server Error.'}, :status => 500
    end

    # Only allow a list of trusted parameters through.
    def hobby_params
      params.require(:hobby).permit(:user_id, :name)
    end
end
