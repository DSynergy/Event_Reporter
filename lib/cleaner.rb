class Cleaner

  def initialize(contents)
    @contents = contents
  end

  def clean_all
    clean_state
    clean_zipcode
    clean_first_name
    clean_last_name
    clean_home_phone
    clean_city
    clean_email_address
    clean_regdate
    clean_street
  end

  def clean_regdate
    @contents[:regdate] = @contents[:regdate].map do|regdate|
      if regdate.nil?
        regdate = "xx"
      else
        regdate
      end
    end
  end

  def clean_state
    @contents[:state] = @contents[:state].map do|state|
      if state.nil?
        state = "xx"
      else
        state.downcase
      end
    end
  end

  def clean_zipcode
    @contents[:zipcode] = @contents[:zipcode].map{|zipcode| zipcode.to_s.rjust(5,'0')}
  end

  def clean_first_name
    @contents[:first_name] = @contents[:first_name].map do |first_name|
      if first_name.nil?
        first_name = "xx"
      else
        first_name.downcase
      end
    end
  end


  def clean_last_name
    @contents[:last_name] = @contents[:last_name].map do |last_name|
      if last_name.nil?
        last_name = "xx"
      else
        last_name.downcase
      end
    end
  end


  def clean_email_address
    @contents[:email_address] = @contents[:email_address].map do |email_address|
      if email_address.nil?
        email_address = "xx"
      else
        email_address.downcase
      end
    end
  end

  def clean_street
    @contents[:street] = @contents[:street].map do |street|
      if street.nil?
        street = "xx"
      else
        street
      end
    end
  end

  def clean_home_phone
    @contents[:homephone] = @contents[:homephone].map do |homephone|
      if homephone.nil?
        homephone = "0000000000"
      else
        homephone.gsub!(/\D/,'')
      end
    end
  end

  def clean_city
    @contents[:city] = @contents[:city].map do|city|
      if city.nil?
        city = "xx"
      else
        city.downcase
      end
     end
   end

end
