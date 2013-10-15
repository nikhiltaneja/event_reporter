class Attendee
  attr_accessor :first_name,
                :last_name,
                :email,
                :home_phone,
                :street,
                :city,
                :state,
                :zipcode

  def initialize(data)
    @first_name = data[:first_name].to_s
    @last_name = data[:last_name].to_s
    @email = data[:email].to_s
    @home_phone = clean_home_phone(data[:home_phone]).to_s
    @street = data[:street].to_s
    @city = data[:city].to_s
    @state = data[:state].to_s
    @zipcode = clean_zipcode(data[:zipcode]).to_s
  end

  def clean_home_phone(number)
    if number
      number.tr!('^0-9', '')

      if number.length == 10
        number
      elsif number.length < 10 || number.length > 11
        number = nil
      elsif number.length == 11 && number[0] == "1"
        number = number[1..-1]
      elsif number.length == 11
        number = nil
      else
        number = nil
      end
    end
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

end
