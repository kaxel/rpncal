class Calc
  
  OPERATORS = ["+", "-", "/", "*"]
  
  def take(args)
    all_args = []
    my_args = args.split(" ")
    last_arg = ""
    my_args.each do |a|
      #puts "process #{a}"
      last_arg = a
      all_args.push last_arg
    end
    if OPERATORS.include?(last_arg)
      #operate
      #check for num of args
      if all_args.size<3
        all_args.pop
        return "ERROR"
      else
        all_args.pop
        first_val = all_args.pop
        second_val = all_args.pop
        new_val = eval("#{first_val} #{last_arg} #{second_val}")
        all_args << new_val
        return new_val
      end
      
    else
      return last_arg.to_i
    end
    
  end
  
end