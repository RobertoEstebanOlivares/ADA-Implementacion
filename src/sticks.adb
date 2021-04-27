package body Sticks is

   procedure Get (C: in out Stick) is
   begin
      C.Get;
   end Get;
   
   procedure Drop (C: in out Stick) is
   begin
      C.Drop;
   end Drop;
   
   protected body Stick is
      
      entry Get when State = FREE is
      begin
         State := TAKEN;
      end Get;
      
      entry Drop when State = TAKEN is
      begin
         State := FREE;
         end Drop;
   end Stick;   

end Sticks;
