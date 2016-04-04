require_dependency "booqcms/application_controller"

module Booqcms
  class EntriesController < ApplicationController
    respond_to :html, :json
    before_action :set_entry, only: [:show, :edit, :update, :destroy]

    def index
      @entries = Entry.where(type: content_class)
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
      @entry = Entry.new(type: content_class)
    end

    def edit
      @entry = Entry.find(params[:id])
    end

    def create
      @entry = Entry.new(entry_params)
      if @entry.save
        redirect_to edit_entry_path(content_class, @entry[:id]), :notice => "The Entry was Saved!", :format => :json
      else
        render :action => "new", :notice => "didn't save"
      end
    end

    def update
      if @entry.update(entry_params)
        flash[:notice] = "The Entry was updated!!"
        respond_with(@entry, :location => edit_entry_path(content_class, @entry.id))
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
      allowed_attrs = %i(id type title slug published_at)
        .concat(content_class.constantize.content_attributes.keys)

      params.require(:entry).permit(*allowed_attrs)
    end

    def content_class
      @content_class ||= params[:content_class].classify
    end
    helper_method :content_class
  end
end
