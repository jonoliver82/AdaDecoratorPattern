with Ada.Text_IO; use Ada.Text_IO;
with Base_Implementation; use Base_Implementation;
with Holder_Implementations; use Holder_Implementations;

package body Holder_Client is

   procedure Test is
      
      procedure Client_Test_Holder(Calculator : in out Base_Calculator'Class) is
         Result : Integer;      
      begin
         Result := Calculator.Add(1, 2);
         Put_Line(Result'Image);
      end Client_Test_Holder;
      
      normal : Normal_Calculator;
      cachedCalculatorHolder: Cached_Calculator_Holder := (Decorated => Concrete_Calculators_Holder.To_Holder(normal), HasCache => false, CacheValue => 0);
      
   begin
      
      Put_Line("---- Using Holder instead of Access, No decoration ----");
      Client_Test_Holder(normal);
   
      Put_Line("---- Using Holder instead of Access, No decoration ----");
      Client_Test_Holder(cachedCalculatorHolder);
      Client_Test_Holder(cachedCalculatorHolder);
      
   end Test;
   

end Holder_Client;
