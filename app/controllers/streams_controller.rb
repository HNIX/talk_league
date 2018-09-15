class StreamsController < ApplicationController
  before_action :set_stream, only: [:edit, :update, :show, :destroy]

  def new
    @stream = Stream.new
  end

  def create

    @stream = Stream.new(stream_params)
    @stream.save
    if @stream.save
      flash[:notice] = "Stream was successfully created"
      redirect_to stream_path(@stream)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @stream.update(stream_params)
      flash[:notice] = "Stream was successfully updated"
      redirect_to stream_path(@stream)
    else
      render 'edit'
    end
  end

  def index
    @streams = Stream.all
  end

  def destroy
    @stream.destroy
    flash[:notice] = "Stream was successfully deleted"
    redirect_to streams_path
  end

  private

  def set_stream

    @stream = Stream.find(params[:id])

  end

  def stream_params
    params.require(:stream).permit(:title, :go_live)
  end

end
