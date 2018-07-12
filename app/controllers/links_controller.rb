require 'uri'

class LinksController < ApplicationController
  def index
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
    rand
  end

  def create
    # render plain: params[:link].inspect
    orgn = params[:link][:original]
    if valid_url?(orgn)
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
          render 'new'
        end
      end
    else
      flash[:alert] = orgn + " is not a vaild URL"
      render 'new'
    end
  end


  private def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end
  private def link_params
    params.require(:link).permit(:original)
  end
end
