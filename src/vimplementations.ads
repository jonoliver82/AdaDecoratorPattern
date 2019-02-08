with vinterfaces; use vinterfaces;

package vimplementations is

   type Concrete_Calculators is abstract new ICalculator with null record;
   type Concrete_Calculators_Access is access Concrete_Calculators'Class;
   
   type Normal_Calculator is new Concrete_Calculators with null record;
   function Add(Self: in out Normal_Calculator; X:Integer; Y:Integer) return Integer;
   
   type Cached_Calculator is new Concrete_Calculators with 
      record
         Decorated: Concrete_Calculators_Access;
         HasCache: Boolean;
         CacheValue: Integer;
      end record;      
   function Add(Self: in out Cached_Calculator; X:Integer; Y:Integer) return Integer;
   
   type Logging_Calculator is new Concrete_Calculators with
      record
         Decorated: Concrete_Calculators_Access;
      end record;
   function Add(Self: in out Logging_Calculator; X:Integer; Y:Integer) return Integer;
   
   type Profiling_Calculator is new Concrete_Calculators with
      record
         Decorated: Concrete_Calculators_Access;
      end record;
   function Add(Self: in out Profiling_Calculator; X:Integer; Y:Integer) return Integer;

end vimplementations;
