with Base_Interfaces; use Base_Interfaces;

package Base_Implementation is

   -- Create a concrete type that implements the inteface
   -- The access and holder subtypes are subtypes of this
   type Base_Calculator is abstract new ICalculator with null record;
   
   type Normal_Calculator is new Base_Calculator with null record;
   function Add(Self: in out Normal_Calculator; X:Integer; Y:Integer) return Integer;

end Base_Implementation;
