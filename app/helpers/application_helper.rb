module ApplicationHelper

  def edit_btn
    '<span class="btn btn-sm btn-primary"><i class="fa fa-pencil"></i></span>'
  end

  def destroy_btn
    '<span class="btn btn-sm btn-danger"><i class="fa fa-close"></i></span>'
  end

  def new_btn
    '<span class="btn  btn-success"><i class="fa fa-plus"></i> नयाँ थप्ने </span>'
  end

  def back_btn
    '<span class="btn  btn-danger"><i class="fa fa-arrow-left"></i> पछि जाने</span>'
  end

  def accept_btn
    '<span class="btn btn-sm btn-success"><i class="fa fa-check"></i></span>'
  end

  def addi_btn
    '<span class="btn  btn-danger"><i class="fa fa-plus"></i></span>'
  end

  def show_btn
    '<span class="btn btn-sm btn-success"><i class="fa fa-eye"></i></span>'
  end

  def show_big_btn
    '<span class="btn  btn-success"><i class="fa fa-eye"></i> हेर्ने </span>'
  end

  def ledger_entry_btn
    '<span class="btn  btn-success"><i class="fa fa-arrow-circle-right"></i> खातामा प्रविष्ट </span>'
  end

  def purchase_entry_btn
    '<span class="btn  btn-success"><i class="fa fa-arrow-circle-right"></i> दाखिला गर्ने </span>'
  end

  def item_assistance_register_btn
    '<span class="btn  btn-success"><i class="fa fa-arrow-circle-right"></i> सहायक जिन्सी खातामा प्रविष्ट गर्ने </span>'
  end

  def release_generate_btn
    '<span class="btn  btn-success"><i class="fa fa-arrow-circle-right"></i> निकासा गर्ने </span>'
  end


  def expense_item_ledger_btn
    '<span class="btn  btn-success"><i class="fa fa-eye"></i> जिन्सी खाता नं ५२ </span>'
  end

  def non_expense_item_ledger_btn
    '<span class="btn  btn-success"><i class="fa fa-eye"></i> जिन्सी खाता नं ४७ </span>'
  end

  def save_btn
    'सुरक्षित गर्ने '
  end

  def edit_big_btn
    '<span class="btn  btn-primary"><i class="fa fa-pencil"></i> सम्पादन गर्ने</span>'
  end

  def print_big_btn
    '<span class="btn  btn-info"><i class="fa fa-print"></i> प्रिन्ट गर्ने</span>'
  end

  def print_entry_big_btn
    '<span class="btn  btn-success"><i class="fa fa-print"></i> दाखिला रिपोर्ट प्रिन्ट गर्ने</span>'
  end

  def add_big_btn
    '<span class="btn  btn-warning"><i class="fa fa-plus"></i> जिन्सी थप गर्ने</span>'
  end

  def final_btn
    '<span class="btn btn-warning"><i class="fa fa-check"></i>स्वीकृत गर्ने</span>'
  end

  def before_final_btn
    '<span class="btn  btn-danger"><i class="fa fa-close"></i>अस्वीकृत गर्ने</span>'
  end

  def repair_complete_btn
    '<span class="btn  btn-success"><i class="fa fa-check"></i>मर्मत सम्पन्न</span>'
  end

  def can_unmark obj
    (obj.marked_as_final == true) && (DateTime.now < 30.days.after(obj.updated_at))
  end

  def nd input
    @nep = ["०", "१", "२", "३", "४", "५", "६", "७", "८", "९"]
    @digits = input.to_s.split('')
    @num = ""
    @digits.each do |d|
      if d =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
        @num = @num + @nep[d.to_i].to_s
      else
        @num = @num + d
      end
    end
    @num
  end

  def ndate input
    if input.nil? == false
      begin
        nd DateTime.parse(input.to_s).strftime("%Y-%m-%d")
      rescue ArgumentError
        "Invalid Date"
      end
    else
      ''
    end
  end

  def bs_today
    date = Date.today()
    y = date.year
    m = date.month
    d = date.day
    bs = NepaliDateConverter::Convert.to_nepali(y, m, d)
    "#{bs[:year]}-#{bs[:month]}-#{bs[:date]}"
  end

  def short_bs_date date
    date.strftime("%Y-%m-%d")
  end
end
