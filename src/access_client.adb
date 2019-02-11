with Ada.Text_IO; use Ada.Text_IO;
with Base_Implementation; use Base_Implementation;
with Access_Implementations; use Access_Implementations;

package body Access_Client is

   procedure Test is
     
      procedure Client_Test(Calculator :  Concrete_Calculators_Access) is
         Result: Integer;
      begin
         Result := Calculator.Add(3, 5);
         Put_Line(Result'Image);
      end Client_Test;
      
      concrete: Concrete_Calculators_Access := new Normal_Calculator;
      cached: Concrete_Calculators_Access := new Cached_Calculator'(Decorated => concrete, HasCache => false, CacheValue => 0);
      logging: Concrete_Calculators_Access := new Logging_Calculator'(Decorated => concrete);
      profiling: Concrete_Calculators_Access := new Profiling_Calculator'(Decorated => concrete);

      loggingProfiling: Concrete_Calculators_Access := new Logging_Calculator'(Decorated => profiling);
      loggingCached: Concrete_Calculators_Access := new Logging_Calculator'(Decorated => cached);

      cachedLoggingProfiling: Concrete_Calculators_Access := new Cached_Calculator'(Decorated => loggingProfiling, HasCache => false, CacheValue => 0);
      
   begin
      
      Put_Line("---- ACCESS/NORMAL ----");
      Client_Test(concrete);

      Put_Line("---- ACCESS/CACHED DECORATOR ----");
      Client_Test(cached);
      Client_Test(cached);

      Put_Line("---- ACCESS/LOGGING DECORATOR ----");
      Client_Test(logging);

      Put_Line("---- ACCESS/PROFILING DECORATOR ----");
      Client_Test(profiling);

      Put_Line("---- ACCESS/COMBINED LOGGING & PROFILING DECORATOR ----");
      Client_Test(loggingProfiling);

      Put_Line("---- ACCESS/COMBINED LOGGING & CACHED DECORATOR ----");
      Client_Test(loggingCached);

      Put_Line("---- ACCESS/COMBINED CACHED & LOGGING & PROFILING DECORATOR ----");
      Client_Test(cachedLoggingProfiling);

   end Test;

end Access_Client;
