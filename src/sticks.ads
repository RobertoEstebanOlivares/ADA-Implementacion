package Sticks is
   
   type Stick is limited private;
   procedure Get(C: in out Stick);
   procedure Drop(C: in out Stick);
 
private
   
   type TState is (FREE, TAKEN);
 
   protected type Stick(Stick_State: TState := FREE) is
      entry Get;
      entry Drop;
   private
      State: TState := Stick_State;
   end Stick;

end Sticks;
