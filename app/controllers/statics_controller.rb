require 'pathname'
class StaticsController < ApplicationController
  def show
    @page = params[:page]
     begin
      path = Pathname.new(@page).realpath
      if(path.to_s.start_with?(Rails.root.to_s))
      	render file: Rails.root.join(path)
      else
      	render :action => 'not_found'
      end
    rescue
      render :action => 'not_found'
    end
  end
end
