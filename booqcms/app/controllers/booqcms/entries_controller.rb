require_dependency "booqcms/application_controller"

module Booqcms
  class EntriesController < ApplicationController
    respond_to :html, :json, :js
    before_action :set_entry, only: [:show, :edit, :update, :destroy]
    before_filter :reify_entry, only: [:show, :edit]

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
    end

    def update
     @entry.attributes = entry_params
     if @entry.draft_update
        flash.now[:success] = 'a draft of this entry was saved'
        render :edit
      else
        flash.now[:error] = 'there was an error saving this draft'
        render :edit
      end
    end

    def preview
      @entry = Entry.find(params[:entry_id])
      respond_to do |format|
        format.js {render layout: false}
      end
      # respond_with @entry
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
      if @entry.draft?
        @entry.draft.publish!
        respond_with(@entry, :location => edit_entry_path(@entry.id))
      else
        @entry.published_at = Time.now
        @entry.save!
        respond_with(@entry, :location => edit_entry_path(@entry.id))
      end
    end

    private

    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      allowed_attrs = %i(id category title slug published_at payload featured_image all_tags author_name post_type content_format)
      params.require(:entry).permit(*allowed_attrs)
    end

    def reify_entry
      @entry = @entry.draft.reify if @entry.draft?
    end
  end
end
