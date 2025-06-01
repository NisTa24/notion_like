class Pages::BlocksController < ApplicationController
  before_action :set_page, only: %w[create update]

  def create
    @block = @page.blocks.create!(
      blockable: params[:blockable_type].constantize.new(new_block_params)
    )

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to edit_page_path(@page) }
    end
  end

  def update
    Block.find(params[:id]).update(existing_block_params)

    redirect_to edit_page_path(@page)
  end

  def destroy
    Block.find(params[:id]).destroy
  end

  private

  def set_page
    @page = Page.find(params[:page_id])
  end

  def new_block_params
    params.permit(blockable_attributes: [ :level ])[:blockable_attributes].to_h.compact_blank
  end

  def existing_block_params
    params.require(:block).permit(:id, blockable_attributes: [ :id, :level, :content ])
  end
end
