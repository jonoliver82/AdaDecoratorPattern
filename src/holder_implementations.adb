with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

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
   
   -- Logging_Calculator_Holder
   overriding
   function Add(Self : in out Logging_Calculator_Holder; X:Integer; Y:Integer) return Integer is
      Decorated_Element : Base_Calculator'Class := Self.Decorated.Element;
      Result: Integer;
   begin
      Put_Line("Logging before Add");
      
      -- Call the decorated object
      Result := Decorated_Element.Add(X, Y);
      
      Put_Line("Logging After Add");
      return Result;
   end Add;
   
   -- Profiling_Calculator
   overriding
   function Add(Self : in out Profiling_Calculator_Holder; X:Integer; Y:Integer) return Integer is
      Decorated_Element : Base_Calculator'Class := Self.Decorated.Element;
      Result: Integer;
      StartTime: Time;
      Diff: Duration;
   begin
      StartTime := Clock;
      
      -- Call the decorated object
      Result := Decorated_Element.Add(X, Y);
      
      Diff := To_Duration(Clock - StartTime);      
      Put_Line("Method execution took " & Diff'Image & "s");
      
      return Result;
   end Add;

end Holder_Implementations;
