class Pages::BlockTypesController < ApplicationController
  def update
    @block = Block.find(params[:id])
    target_type = block_params[:blockable_type]
    blockable_attributes = block_params[:blockable_attributes] || {}

    if target_type && @block.blockable_type != target_type
      @block.change_blockable_type(target_type, blockable_attributes)
    elsif blockable_attributes.present?
      @block.blockable.update!(blockable_attributes)
    end
  end

  private

  def block_params
    params.require(:block).permit(
      :blockable_type,
      blockable_attributes: [ :id, :level, :content ]
    )
  end
end
