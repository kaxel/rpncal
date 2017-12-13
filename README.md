# rpncal

I have written a Ruby class called 'Calc.rb' that has a single method 'take' which implements the RPN calculator. There is a wrapper called 'cl.rb' that can be used to interface with the class.

Simply clone the project: https://github.com/kaxel/rpncal

cd rpncal
and call it like so: ruby cl.rb

run the tests like this: bin/rspec --format doc

I kept the implemention very simple, non-operators just get pushed to the stack, and the operator gets evaluated inside an 'eval' call after we have already confirmed it is included in ["*", "/", "+", "-"]. I kept a separate elsif block to save space for 'other' operators as per the original spec.

One issue I ran into is with this code (Calc.rb line 23):

    new_val = eval("#{second_val.to_f} #{last_arg} #{first_val.to_f}")

used to be:

    new_val = eval("#{first_val.to_f} #{last_arg} #{second_val.to_f}")

which is how I learned RPN, that the last value off the stack substracts (or adds, or whatever) the second to last from itself; you have it explicitly reversed in your last test case, so I assume that I am wrong about that, but it's easy enough to switch if I am right.

#final notes

I still need to tie down the numerical types; it is sort of easy to get a bit of floating point detritus once you start using the divison operator;

and, of course, I need to implement brackets, which I would like to do using recursion.
