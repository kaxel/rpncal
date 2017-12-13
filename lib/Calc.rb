class Calc
  
  OPERATORS = ["+", "-", "/", "*"]
  CUSTOM_OPERATORS = []
  
  class MissingValuesError < StandardError
  end
  
  def take(args)
    
    my_args = args.split(" ")
    last_arg = ""
    my_args.each do |a|
      last_arg = a
      add_arg(last_arg)
    end
    if OPERATORS.include?(last_arg)
      #check for num of args
      if @all_args.size<3
        remove_arg
        raise MissingValuesError, "not enough input values to support operation."
      else
        remove_arg
        first_val = remove_arg
        second_val = remove_arg
        new_val = eval("#{second_val.to_f} #{last_arg} #{first_val.to_f}")
        add_arg(new_val)
        return new_val
      end
    elsif CUSTOM_OPERATORS.include?(last_arg)
      #handle custom operators
    else
      return last_arg.to_i
    end
    
  end
  
  private
  
  def add_arg(added)
    @all_args = @all_args ? @all_args : []
    @all_args<<added
  end
  
  def remove_arg
    @all_args = @all_args ? @all_args : []
    return @all_args.pop
  end
  
end