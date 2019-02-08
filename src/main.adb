with Ada.Text_IO; use Ada.Text_IO;
with vinterfaces; use vinterfaces;
with vimplementations; use vimplementations;

procedure Main is

   -- Demonstrates the Decorator Pattern using Access types
   -- TODO consider Indefinite Holder

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

   Put_Line("---- No decoration ----");
   Client_Test(concrete);

   Put_Line("---- Cached Decorator ----");
   Client_Test(cached);
   Client_Test(cached);

   Put_Line("---- Logging Decorator ----");
   Client_Test(logging);

   Put_Line("---- Profiling Decorator ----");
   Client_Test(profiling);

   Put_Line("---- Combined Logging & Profiling Decorator ----");
   Client_Test(loggingProfiling);

   Put_Line("---- Combined Logging & Cached Decorator ----");
   Client_Test(loggingCached);

   Put_Line("---- Combined Cachced & Logging & Profiling Decorator ----");
   Client_Test(cachedLoggingProfiling);

end Main;
