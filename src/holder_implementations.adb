with Ada.Text_IO; use Ada.Text_IO;

package body Holder_Implementations is

   -- Cached_Calculator_Holder   
   overriding
   function Add(Self : in out Cached_Calculator_Holder; X:Integer; Y:Integer) return Integer is
      Decorated_Element : Base_Calculator'Class := Self.Decorated.Element;
   begin
      If Self.HasCache = False Then
         Put_Line("Holder Not in cache");
         
         -- Call the decorated object and store result in cache
         Self.CacheValue := Decorated_Element.Add(X, Y);         
         Self.HasCache := True;
      Else
         Put_Line("Holder In Cache");
      End If;
            
      return Self.CacheValue;
   end Add;

end Holder_Implementations;
