class Office::ItemEvaluationItemsController < ProjectController
  before_action :set_evaluation_item, only: [:edit, :update]

  def edit
    @item_evaluation_item = Office::ItemEvaluationItem.find(params[:id])
    render layout: 'modal'
  end

  def update
    @item_evaluation_item = Office::ItemEvaluationItem.find(params[:id])
    @item_evaluation_item.update(evaluation_item_params)
    @item_evaluation_item.working = (@item_evaluation_item.quantity - @item_evaluation_item.notworking) if @item_evaluation_item.notworking.present?
    if @item_evaluation_item.dquantity.present?
      @item_evaluation_item.diquantity = @item_evaluation_item.dquantity if @item_evaluation_item.dquantity > 0
    end
    if @item_evaluation_item.iquantity.present?
      @item_evaluation_item.diquantity = @item_evaluation_item.iquantity if @item_evaluation_item.iquantity > 0
    end

    if @item_evaluation_item.unmatched.present?
      @item_evaluation_item.matched = @item_evaluation_item.quantity - @item_evaluation_item.unmatched
    end
    @item_evaluation_item.save!
    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript' }
    end
  end

  private

  def set_evaluation_item
    @item_evaluation_item = Office::ItemEvaluationItem.find(params[:id])
  end

  def evaluation_item_params
    params.require(:office_item_evaluation_item).permit(:unmatched, :dquantity, :iquantity, :diquantity, :notworking, :to_be_repaired, :to_be_auctioned, :to_be_disposed, :to_be_conserved, :remarks )
  end
end
