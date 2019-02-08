with Ada.Text_IO; use Ada.Text_IO;
with Access_Client;
with Holder_Client;

procedure Main is

begin

   Put_Line("Begin");

   Access_Client.Test;
   Holder_Client.Test;

   Put_Line("End");

end Main;
