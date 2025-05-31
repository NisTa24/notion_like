class PagesController < ApplicationController
  def show
    @blocks = Page.find(params[:id]).blocks
  end
end
