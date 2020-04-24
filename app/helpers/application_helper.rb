module ApplicationHelper
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
