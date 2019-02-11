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
   
   type Logging_Calculator_Holder is new Base_Calculator with
      record
         Decorated: Concrete_Calculators_Holder.Holder;
      end record;
   function Add(Self: in out Logging_Calculator_Holder; X:Integer; Y:Integer) return Integer;
   
   type Profiling_Calculator_Holder is new Base_Calculator with
      record
         Decorated: Concrete_Calculators_Holder.Holder;
      end record;
   function Add(Self: in out Profiling_Calculator_Holder; X:Integer; Y:Integer) return Integer;
 
end Holder_Implementations;
