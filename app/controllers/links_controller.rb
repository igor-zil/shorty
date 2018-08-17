require 'base62-rb'

class LinksController < ApplicationController
  include ApplicationHelper

  def index
    flash[:notice] = nil
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def process_custom_short
    short = params[:short]
    @found = Link.find_by short: short
    if @found
      original = @found.original
      redirect_to original
    else
      flash[:error] = "No record found for " + short
      render 'new'
    end
  end

  def process_short
    short = params[:short]
    id = Base62.decode(short)
    @found = Link.find_by id: id
    if @found
      original = @found.original
      redirect_to original
    else
      flash[:error] = "No record found for " + short
      render 'new'
    end
  end

  def create_new_no_short original
    @link = Link.new(original: original)
    if (@link.save)
      flash[:notice] = "Record saved"
      @short_link = my_link_to(@link.get_shorty)
      respond_to do |format|
        format.html {redirect_to '/links/new'}
        format.js # by default render links/create.js.erb
      end
      return
    else
      #puts @link.errors.full_messages
      flash[:error] = "Invalid URL " + original
      redirect_to @link
    end
  end

  def create_new_with_short original, short
    @found = Link.find_by short: short
    if @found
      flash[:notice] = "Existing short"
      redirect_to @found
    else
      @link = Link.new(original: original, short: short)
      if (@link.save)
        flash[:notice] = "Record saved"
        redirect_to @link
      else
        flash[:error] = original + " is not valid URL"
        render 'new'
      end
    end
  end

  def create
    # render plain: params[:link].inspect
    original = params[:link][:original]
    short = params[:link][:short]
    @found = Link.find_by original: original
    if @found
      #short = @found.attributes['short']
      flash[:notice] = "Existing record"
      return redirect_to @found
    end

    # New original URL
    if short.blank?
      create_new_no_short original
    else
      create_new_with_short original, short
    end
  end

  private def link_params
    params.require(:link).permit(:original)
    #params.require(:link).permit(:short)
  end
end


