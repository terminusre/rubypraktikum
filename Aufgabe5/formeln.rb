# TODO approx_2
 def summe1(i)

   return (0..i+1).inject {|sum, i|
     
     sum+(1/(2.0**(i-1)))
  
   
   }
   
 end
# TODO approx_1_halb
 def approx_1_halb(i)
   return (0..i).inject{|sum,i|
   
   sum+(1/((2.0*i-1)*(2.0*i+1)))
   
   }
 end
# TODO approx_ln(x,n)
 def approx_ln(x,n)
   return (0..n).inject{|sum,i|
   sum+((-1.0)**(i+1))*(((x-1.0)**i)/i)  
   
   
   }
 end
 
 puts summe1(1)
 puts approx_1_halb(50)
 puts approx_ln(1.1,5)
 