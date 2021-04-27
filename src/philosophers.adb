-- Adaptado de:...
-- http://es.wikibooks.org/wiki/Programaci%C3%B3n_en_Ada/Tareas/Ejemplos

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Sticks; use Sticks;

procedure Philosophers is

   type PStick is access Stick;

   task type TPhilosopher(Id: Character; Stick1: PStick; Stick2: PStick);

   task body TPhilosopher is

      procedure Eat is
      begin
         Get(Stick1.all);
         Get(Stick2.all);
         Put(Id & "c ");
         delay 1.0;
         Drop(Stick2.all);
         Drop(Stick1.all);
      end Eat;

      procedure Think is
      begin
         Put(Id & "p ");
         delay 3.0;
      end Think;

   begin
      loop
         Eat;
         Think;
      end loop;
   end TPhilosopher;

   Num_Sticks: Positive;

begin

   Put("Number of philosophers: "); Get(Num_Sticks); New_line;

   declare
      type PTPhilosopher is access TPhilosopher;
      P: PTPhilosopher;
      C: Character := 'A';
      StickList: array (1..Num_Sticks) of PStick;

   begin
      for i in 1..Num_Sticks loop
         StickList(i) := new Stick;
      end loop;

      for i in 1..Num_Sticks-1 loop
         P := new TPhilosopher(C, StickList(i), StickList(i+1));
         C := Character'Succ(C); -- To get the next ID
      end loop;

      -- Last philosoper
      P := new TPhilosopher(C, StickList(1), StickList(Num_Sticks));
   end;
end Philosophers;
