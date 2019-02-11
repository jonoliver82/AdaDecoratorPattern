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
      
      cachedHolder: Cached_Calculator_Holder := (Decorated => Concrete_Calculators_Holder.To_Holder(normal), HasCache => false, CacheValue => 0);
      loggingHolder: Logging_Calculator_Holder := (Decorated => Concrete_Calculators_Holder.To_Holder(normal));
      profilingHolder: Profiling_Calculator_Holder := (Decorated => Concrete_Calculators_Holder.To_Holder(normal));

      loggingProfilingHolder: Logging_Calculator_Holder := (Decorated => Concrete_Calculators_Holder.To_Holder(profilingHolder));
      loggingCachedHolder: Logging_Calculator_Holder := (Decorated => Concrete_Calculators_Holder.To_Holder(cachedHolder));

      cachedLoggingProfilingHolder: Cached_Calculator_Holder := (Decorated => Concrete_Calculators_Holder.To_Holder(loggingProfilingHolder), HasCache => false, CacheValue => 0);
      
   begin
      
      Put_Line("---- HOLDER/NORMAL ----");
      Client_Test_Holder(normal);
   
      Put_Line("---- HOLDER/CACHED DECORATOR ----");
      Client_Test_Holder(cachedHolder);
      Client_Test_Holder(cachedHolder);
      
      Put_Line("---- HOLDER/LOGGING DECORATOR ----");
      Client_Test_Holder(loggingHolder);

      Put_Line("---- HOLDER/PROFILING DECORATOR ----");
      Client_Test_Holder(profilingHolder);

      Put_Line("---- HOLDER/COMBINED LOGGING & PROFILING DECORATOR ----");
      Client_Test_Holder(loggingProfilingHolder);

      Put_Line("---- HOLDER/COMBINED LOGGING & CACHED DECORATOR ----");
      Client_Test_Holder(loggingCachedHolder);

      Put_Line("---- HOLDER/COMBINED CACHED & LOGGING & PROFILING DECORATOR ----");
      Client_Test_Holder(cachedLoggingProfilingHolder);
      
   end Test;

end Holder_Client;
