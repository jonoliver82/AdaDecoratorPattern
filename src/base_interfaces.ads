package Base_Interfaces is

   type ICalculator is interface;
   function Add(Self: in out ICalculator; X:Integer; Y:Integer) return Integer is abstract;

end Base_Interfaces;
