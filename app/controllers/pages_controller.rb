class PagesController < ApplicationController
  before_action :set_page, only: %w[show edit]

  def show
    @blocks = @page.blocks
  end

  def edit
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end
end
