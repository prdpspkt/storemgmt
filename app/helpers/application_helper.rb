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

  def show_btn
    '<span class="btn btn-sm btn-success"><i class="fa fa-eye"></i></span>'
  end

  def show_big_btn
    '<span class="btn  btn-success"><i class="fa fa-eye"></i> हेर्ने </span>'
  end

  def save_btn
    'सुरक्षित गर्ने '
  end

  def edit_big_btn
    '<span class="btn  btn-primary"><i class="fa fa-pencil"></i> सम्पादन गर्ने</span>'
  end

  def print_big_btn
    '<span class="btn  btn-success"><i class="fa fa-print"></i> प्रिन्ट गर्ने</span>'
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

  def can_unmark obj
    (obj.marked_as_final == true) && (DateTime.now < 3.days.after(obj.updated_at))
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
    nd DateTime.parse(input.to_s).strftime("%Y-%m-%d")
  end
end
