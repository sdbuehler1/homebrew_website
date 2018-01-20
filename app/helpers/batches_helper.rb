module BatchesHelper

  def get_abv(og, fg)

    if og.nil? || fg.nil?
       abv = 0
    else
      abv = (  og - fg ) * 131.25
    end

    return abv.round(1)

  end

  def get_age(batch)

    if batch.ontap == "no"
      return ""
    else
      if batch.bottle_date.nil?
        age = 0.0
      else
        today = DateTime.now
        age = ( today - batch.bottle_date ) / 7
      end
      return age.to_i
    end 

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
