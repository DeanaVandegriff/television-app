class ShowsController < ApplicationController
  def index
    shows = Show.all
    render json: shows.as_json
  end

  def create
    show = Show.new(
      title: params[:title],
      year: params[:year],
      plot: params[:plot],
    )
    show.save
    render json: show.as_json
  end

  def show
    show = Show.find_by(id: params[:id])
    render json: show.as_json
  end

  def update
    show = Show.find_by(id: params[:id])
    show.title = params[:title] || show.title
    show.year = params[:year] || show.year
    show.plot = params[:plot] || show.plot
    show.save
    render json: show.as_json
  end

  def destroy
    show = Show.find_by(id: params[:id])
    show.destroy
    render json: {message: "show removed"}
  end

end
