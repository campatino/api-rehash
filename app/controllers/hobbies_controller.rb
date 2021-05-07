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

  # GET /hobbies/all
  def all
    records_per_page = 10
    total = Hobby.all.count
    pages = (Float(total)/records_per_page).ceil
    
    if params[:page]
      page = params[:page].to_i
      if page >= 1 && page <= pages
        current_page = page
      else
        current_page = 1
      end
    else
      current_page = 1
    end

    hobbies = Hobby.limit(records_per_page).offset((current_page - 1) * records_per_page)

    render json: {:current_page => current_page, :pages => pages, :total => total, :hobbies => hobbies}
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
