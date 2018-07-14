require 'valid_url'

class LinksController < ApplicationController
  def index
    flash[:notice] = nil
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new

  end

  def generate_short
    #rand = SecureRandom.base64(8).gsub("/","_").gsub(/=+$/,"")
    begin
      rand = SecureRandom.hex(10)
      result = Link.find_by short: rand
    end until result.nil?
    'http://k9.com/' + rand
  end

  def create
    # render plain: params[:link].inspect
    orgn = params[:link][:original]
    @found = Link.find_by original: orgn
    if @found
      #shrt = @found.attributes['short']
      shrt = @found.short
      flash[:notice] = "Existing record"
      redirect_to @found
    else
      shrt = generate_short
      @link = Link.new(original: orgn, short: shrt)
      if (@link.save)
        flash[:notice] = "Record saved"
        redirect_to @link
      else
        flash[:error] = orgn + " is not valid URL"
        render 'new'
      end
    end
  end

  private def link_params
    params.require(:link).permit(:original)
    params.require(:link).permit(:short)
  end
end

