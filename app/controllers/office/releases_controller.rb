class Office::ReleasesController < ApplicationController
  before_action :set_office_release, only: [:show, :edit, :update, :destroy, :mark_as_final]

  # GET /office_releases
  # GET /office_releases.json
  def index
    @office_releases = Office::Release.all
  end

  # GET /office_releases/1
  # GET /office_releases/1.json
  def show
    @office_release_items = @office_release.release_items
    @office_release_item = Office::ReleaseItem.new
  end

  # GET /office_releases/new
  def new
    @office_release = Office::Release.new
    @office_release.release_no = new_release_no
  end

  # GET /office_releases/1/edit
  def edit
  end

  # POST /office_releases
  # POST /office_releases.json
  def create
    @office_release = Office::Release.new(office_release_params)
    @office_release.store_chief_name = current_control_body.store_keeper_name
    @office_release.office_chief_name = current_control_body.office_chief_name
    @office_release.user_id = current_user.id
    @office_release.office_id = current_office.id
    @office_release.fiscal_year_id = current_fiscal_year.id
    @office_release.fy = current_fiscal_year.fy
    @office_release.marked_as_final = false
    @office_release.release_no = new_release_no

    respond_to do |format|
      if @office_release.save
        format.html { redirect_to @office_release, notice: 'Office release was successfully created.' }
        format.json { render :show, status: :created, location: @office_release }
      else
        format.html { render :new }
        format.json { render json: @office_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_releases/1
  # PATCH/PUT /office_releases/1.json
  def update
    respond_to do |format|
      if @office_release.update(office_release_params)
        format.html { redirect_to @office_release, notice: 'Office release was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_release }
      else
        format.html { render :edit }
        format.json { render json: @office_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_releases/1
  # DELETE /office_releases/1.json
  def destroy
    @office_release.destroy
    respond_to do |format|
      format.html { redirect_to office_releases_url, notice: 'Office release was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_final
    if (can_unmark(@office_release))
      @office_release.marked_as_final = false
      @office_release.save
    else
      @office_release.marked_as_final = true
      @office_release.save
    end
    redirect_to @office_release
  end

  private

  def can_unmark obj
    (obj.marked_as_final == true) && (DateTime.now < 3.days.after(obj.updated_at))
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_office_release
      @office_release = Office::Release.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_release_params
      params.require(:office_release).permit(:release_no, :release_date, :store_chief_signed_date,  :office_chief_signed_date)
    end

  def new_release_no
    lor = Office::Release.last
    @lorn = false
    if (!lor.blank? && lor.release_no.present?)
      @lorn = lor.release_no + 1
    else
      @lorn = 1
    end
    @lorn
  end
end
