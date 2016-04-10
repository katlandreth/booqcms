require_dependency "booqcms/application_controller"

module Booqcms
  class MediaController < ApplicationController
    before_action :set_image, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
    end

    def new
      @medium = Medium.new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_image
      @medium = Medium.find(params[:id])
    end

  end
end
