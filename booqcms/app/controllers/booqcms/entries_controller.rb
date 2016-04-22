require_dependency "booqcms/application_controller"

module Booqcms
  class EntriesController < ApplicationController
    respond_to :html, :json, :js
    before_action :set_entry, only: [:show, :edit, :update, :destroy]

    def index
      @entries = Entry.all.reverse_order!
    end

    def show
    end

    def preview
      @entry = Entry.find(params[:entry_id])
      respond_to do |format|
        format.js {render layout: false}
      end
    end

    def new
      @entry = Entry.new
    end

    def edit
      @entry = Entry.find(params[:id])
    end

    def create
      @entry = Entry.new(entry_params)
      if @entry.save
        redirect_to edit_entry_path(@entry[:id]), :notice => "The Entry was Saved!", :format => :json
      else
        render :action => "new", :notice => "didn't save"
      end
    end

    def update
      if @entry.update(entry_params)
        respond_with(@entry, :location => edit_entry_path(@entry.id))
      else
        flash[:notice] = "Sad Trombone."
      end
    end

    def destroy
      @entry.destroy
      redirect_to content_entries_path, notice: 'Entry was successfully destroyed.'
    end

    def destroy_multiple
      Entry.destroy(params[:entry_ids])
      redirect_to content_entries_path, notice: 'Entries were successfully destroyed.'
    end

    private

    def set_entry
      @entry = Entry.find(params[:id])
    end


    def entry_params
      allowed_attrs = %i(id category title slug published_at payload featured_image)
      params.require(:entry).permit(*allowed_attrs)
    end
  end
end
