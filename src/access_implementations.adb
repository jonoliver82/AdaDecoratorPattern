with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

package body Access_Implementations is

   -- Cached_Calculator   
   overriding
   function Add(Self : in out Cached_Calculator; X:Integer; Y:Integer) return Integer is
   begin
      If Self.HasCache = False Then
         Put_Line("Not in cache");
         
         -- Call the decoratd object and store result in cache
         Self.CacheValue := Self.Decorated.Add(X, Y);
         
         Self.HasCache := True;
      Else
         Put_Line("In Cache");
      End If;
            
      return Self.CacheValue;
   end Add;

   -- Logging_Calculator
   overriding
   function Add(Self : in out Logging_Calculator; X:Integer; Y:Integer) return Integer is
      Result: Integer;
   begin
      Put_Line("Logging before Add");
      
      -- Call the decorated object
      Result := Self.Decorated.Add(X, Y);
      
      Put_Line("Logging After Add");
      return Result;
   end Add;
   
   -- Profiling_Calculator
   overriding
   function Add(Self : in out Profiling_Calculator; X:Integer; Y:Integer) return Integer is
      Result: Integer;
      StartTime: Time;
      Diff: Duration;
   begin
      StartTime := Clock;
      
      -- Call the decorated object
      Result := Self.Decorated.Add(X, Y);
      
      Diff := To_Duration(Clock - StartTime);      
      Put_Line("Method execution took " & Diff'Image & "s");
      
      return Result;
   end Add;


end Access_Implementations;
