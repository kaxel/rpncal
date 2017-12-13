class Calc
  
  OPERATORS = ["+", "-", "/", "*"]
  @all_args = []
  
  def take(args)
    
    my_args = args.split(" ")
    last_arg = ""
    my_args.each do |a|
      #puts "process #{a}"
      last_arg = a
      add_arg(last_arg)
    end
    if OPERATORS.include?(last_arg)
      #operate
      #check for num of args
      if @all_args.size<3
        puts "process operator"
        puts @all_args.inspect
        remove_arg
        return "ERROR"
      else
        remove_arg
        first_val = remove_arg
        second_val = remove_arg
        new_val = eval("#{first_val} #{last_arg} #{second_val}")
        add_arg(new_val)
        return new_val
      end
      
    else
      return last_arg.to_i
    end
    
  end
  
  def add_arg(added)
    @all_args = @all_args ? @all_args : []
    @all_args<<added
  end
  
  def remove_arg
    @all_args = @all_args ? @all_args : []
    return @all_args.pop
  end
  
end