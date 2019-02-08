with Ada.Containers.Indefinite_Holders;
with Base_Implementation; use Base_Implementation;

package Holder_Implementations is

   package Concrete_Calculators_Holder is new Ada.Containers.Indefinite_Holders(Base_Calculator'Class);
   
   type Cached_Calculator_Holder is new Base_Calculator with
      record
         Decorated: Concrete_Calculators_Holder.Holder;
         HasCache: Boolean;
         CacheValue: Integer;
      end record;
   function Add(Self: in out Cached_Calculator_Holder; X:Integer; Y:Integer) return Integer;
   
   -- TODO Create Logging_Calculator_Holder, Profiling_Calculator_Holder

end Holder_Implementations;
