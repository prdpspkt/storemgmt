class Project::ReleaseItemsController < ProjectController
  before_action :set_office_release_item, only: [:destroy]
  load_and_authorize_resource except: [:create, :new]
# DELETE /office_release_items/1
# DELETE /office_release_items/1.json


  def destroy
    @release = @release_item.release
    respond_to do |format|
      if @release_item.release.entry_generated != true
        @release_item.destroy
      end
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


