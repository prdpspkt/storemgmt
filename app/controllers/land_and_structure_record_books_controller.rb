class LandAndStructureRecordBooksController < ApplicationController
  before_action :set_land_and_structure_record_book, only: [:show, :edit, :update, :destroy]

  # GET /land_and_structure_record_books
  # GET /land_and_structure_record_books.json
  def index
    @land_and_structure_record_books = LandAndStructureRecordBook.all
  end

  # GET /land_and_structure_record_books/1
  # GET /land_and_structure_record_books/1.json
  def show
  end

  # GET /land_and_structure_record_books/new
  def new
    @land_and_structure_record_book = LandAndStructureRecordBook.new
  end

  # GET /land_and_structure_record_books/1/edit
  def edit
  end

  # POST /land_and_structure_record_books
  # POST /land_and_structure_record_books.json
  def create
    @land_and_structure_record_book = LandAndStructureRecordBook.new(land_and_structure_record_book_params)

    respond_to do |format|
      if @land_and_structure_record_book.save
        format.html { redirect_to @land_and_structure_record_book, notice: 'Land and structure record book was successfully created.' }
        format.json { render :show, status: :created, location: @land_and_structure_record_book }
      else
        format.html { render :new }
        format.json { render json: @land_and_structure_record_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /land_and_structure_record_books/1
  # PATCH/PUT /land_and_structure_record_books/1.json
  def update
    respond_to do |format|
      if @land_and_structure_record_book.update(land_and_structure_record_book_params)
        format.html { redirect_to @land_and_structure_record_book, notice: 'Land and structure record book was successfully updated.' }
        format.json { render :show, status: :ok, location: @land_and_structure_record_book }
      else
        format.html { render :edit }
        format.json { render json: @land_and_structure_record_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /land_and_structure_record_books/1
  # DELETE /land_and_structure_record_books/1.json
  def destroy
    @land_and_structure_record_book.destroy
    respond_to do |format|
      format.html { redirect_to land_and_structure_record_books_url, notice: 'Land and structure record book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_land_and_structure_record_book
      @land_and_structure_record_book = LandAndStructureRecordBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def land_and_structure_record_book_params
      params.require(:land_and_structure_record_book).permit(:store_chief_name, :store_chief_designation, :store_chief_signed_date, :office_chief_name, :office_chief_designation, :office_chief_signed_date, :user_id, :fy, :fiscal_year_id, :office_id)
    end
end
