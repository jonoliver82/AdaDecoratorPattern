with Base_Implementation; use Base_Implementation;

package Access_Implementations is

   type Concrete_Calculators_Access is access Base_Calculator'Class;

   type Cached_Calculator is new Base_Calculator with 
      record
         Decorated: Concrete_Calculators_Access;
         HasCache: Boolean;
         CacheValue: Integer;
      end record;      
   function Add(Self: in out Cached_Calculator; X:Integer; Y:Integer) return Integer;

   type Logging_Calculator is new Base_Calculator with
      record
         Decorated: Concrete_Calculators_Access;
      end record;
   function Add(Self: in out Logging_Calculator; X:Integer; Y:Integer) return Integer;
   
   type Profiling_Calculator is new Base_Calculator with
      record
         Decorated: Concrete_Calculators_Access;
      end record;
   function Add(Self: in out Profiling_Calculator; X:Integer; Y:Integer) return Integer;

end Access_Implementations;
