class ReviewsController < ApplicationController
  swagger_controller :reviews, "Review Management"

  # Swagger api documentation for the index endpoint
  swagger_api :index do
    summary "Fetches all Reviews"
    notes "This lists all the reviews"
    param :path, :id, :integer, :required, "Review ID"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
    #response :requested_range_not_satisfiable
  end
  def index
    @reviews = Review.searchable(params.slice(:username, :title, :content, :location_city, :location_country, :rating))
    json_response(@reviews)
  end

  # Swagger api documentation for the show endpoint
  swagger_api :show do
    summary "Fetches a single Review item"
    param :path, :id, :integer, :required, "Review ID"
    response :ok, "Success", :Review
    response :unauthorized
    response :not_acceptable
    response :not_found
    response :unprocessable_entity, "A review with that id does not exist."
  end
  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  # For creating swagger documentation related to the create endpoint
  swagger_api :create do
    summary "To create a review"
    notes "Implementation notes, such as required params, example queries for apis are written here."
    param :form, "review[username]", :string, :required, "Name of user"
    param :form, "review[title]", :string, :required, "Title of Review"
    param :form, "review[content]", :string, :required, "Review Content"
    param :form, "review[location_city]", :string, :required, "City"
    param :form, "review[location_country]", :string, :required, "Country"
    param :form, "review[rating]", :integer, :required, "Rating"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  swagger_api :update do
    summary "To update a review"
    notes "Implementation notes, such as required params, example queries for apis are written here."
    param :form, :username, :string, :required, "Name of user"
    param :form, :title, :string, :required, "Title of Review"
    param :form, :content, :string, :required, "Review Content"
    param :form, :location_city, :string, :required, "City"
    param :form, :location_country, :string, :required, "Country"
    param :form, :rating, :integer, :required, "Rating"
    response :ok, "Successful update"
    response :unprocessable_entity
    response :not_found
  end
  def update
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: { message: "This review has been updated successfully"}
    end
  end

  # Deleting documentation for swagger
  swagger_api :destroy do
    summary "Deletes an existing User Review"
    param :path, :id, :integer, :required, "Review Id"
    # response :unauthorized
    response :not_found
    response :ok, "This review was deleted successfully."
    response :unprocessable_entity
  end
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy!
      render status: 200, json: { message: "This review has been successfully DESTROYED!!!"}
    end
  end

private
  def review_params
    params.permit(:username, :title, :content, :location_city, :location_country, :rating)
  end

end