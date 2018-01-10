module BatchesHelper

  def get_abv(og, fg)

    if og.nil? || fg.nil?
       abv = 0
    else
      abv = (  og - fg ) * 131.25
    end

    return abv.round(1)

  end

  def get_age(bottle_date)

    if bottle_date.nil?
      age = 0.0
    else
      today = DateTime.now
      age = ( today - bottle_date ) / 7
    end

    return age.to_i

  end
 
  def format_date(date_val)

    if date_val.nil?
       date_str = ""
    else
       date_str = date_val.strftime("%m/%d/%y")
    end

    return date_str
 
  end

end
