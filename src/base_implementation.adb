package body Base_Implementation is

      -- Normal_Calculator  
   overriding
   function Add(Self : in out Normal_Calculator; X:Integer; Y:Integer) return Integer is
   begin
      return X + Y;
   end Add;

end Base_Implementation;
