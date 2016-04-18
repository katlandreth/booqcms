require_dependency "booqcms/application_controller"

module Booqcms
  class MediaController < ApplicationController
    respond_to :html, :json, :js
    before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @uploads = Medium.all
  end

  def show
  end

  def new
    @upload = Medium.new
  end

  def edit
  end

  def create
    @upload = Medium.new(media_upload_params)
    if @upload.save
      respond_with @upload
      # respond_to do |format|
      #   format.js
      # end
    else
      render :new
    end
  end

  def update
    if @upload.update(post_upload_params)
      redirect_to @upload, notice: 'Upload attachment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /uploads/1
  def destroy
    @upload.destroy
    redirect_to media_url, notice: 'Upload was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @upload = Medium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_upload_params
      params.require(:medium).permit(:title, :description, :file)
    end
  end
end
