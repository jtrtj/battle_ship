module InputConverter
  def convert_letter_to_int(string)
    integers = []
    first = string[0].downcase
    if first == 'a'
      first = 0
    elsif first == 'b'
      first = 1
    elsif first == 'c'
      first = 2
    elsif first == 'd'
      first = 3
    end
    second = string[1]
    if second == '1'
      second = 0
    elsif second == '2'
      second = 1
    elsif second == '3'
      second = 2
    elsif second == '4'
      second = 3
    end
    integers << first
    integers << second
    integers.join
  end
end
