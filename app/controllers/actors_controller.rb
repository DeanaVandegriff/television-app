class ActorsController < ApplicationController
  def index
    actors = Actors.all
    render json: actors.as_json
  end

  def create
    actor = Actor.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      known_for: params[:known_for],
    )
    actor.save
    render json: actor.as_json
  end

  def show
    actor = actor.find_by(id: params [:id])
    render json: actor.as_json
  end

  def update
    actor = actor.find_by(id: params [:id])
    actor.first_name = params[:first_name] || actor.first_name,
    actor.last_name = params[:last_name] || actor.last_name,
    actor.known_for = params[:known_for] || actor.known_for
    actor.save
    render json: actor.as_json
  end

  def destroy
    actor = actor.find_by(id: params [:id])
    actor.destroy
    render json: {message: "actor removed" }
  end
end