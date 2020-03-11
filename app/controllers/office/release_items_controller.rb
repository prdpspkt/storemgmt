class Office::ReleaseItemsController < ApplicationController
  before_action :set_office_release_item, only: [:destroy]
# DELETE /office_release_items/1
# DELETE /office_release_items/1.json


  def destroy
    @release = @release_item.release
    @release_item.destroy
    respond_to do |format|
      format.html { redirect_to @release, notice: 'Office release item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

# Use callbacks to share common setup or constraints between actions.
  def set_office_release_item
    @release_item = Office::ReleaseItem.find(params[:id])
  end

end


