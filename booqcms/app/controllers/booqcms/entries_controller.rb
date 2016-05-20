require_dependency "booqcms/application_controller"

module Booqcms
  class EntriesController < ApplicationController
    respond_to :html, :json, :js
    before_action :set_entry, only: [:show, :edit, :update, :destroy]

    def index
      if params[:tag]
        @entries = Entry.tagged_with(params[:tag])
      else
        @entries = Entry.all
      end
    end

    def show
    end

    def new
      @entry = Entry.new
    end

    def create
      @entry = Entry.new(entry_params)
      if @entry.draft_creation
        redirect_to edit_entry_path(@entry[:id]), :notice => "The Draft was Saved!", :format => :json
      else
        render :action => "new", :notice => "didn't save"
      end
    end

    def edit
      @entry = Entry.find(params[:id])
    end

    def update
      @entry.attributes = entry_params
      if @entry.draft?
        @entry.draft_update
        respond_with(@entry, :location => edit_entry_path(@entry.id))
      else
        @entry.draft_creation
        respond_with(@entry, :location => edit_entry_path(@entry.id))
      end
    end

    def preview
      @entry = Entry.find(params[:entry_id])
      respond_to do |format|
        format.js {render layout: false}
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

    def publish
      @entry = Entry.find(params[:entry_id])
      if @entry.draft.publish!
        respond_with(@entry, :location => edit_entry_path(@entry.id))
      end
    end

    private

    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      allowed_attrs = %i(id category title slug published_at payload featured_image all_tags author_name post_type)
      params.require(:entry).permit(*allowed_attrs)
    end
  end
end
