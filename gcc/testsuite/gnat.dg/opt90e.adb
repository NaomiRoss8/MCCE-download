-- { dg-do run }
-- { dg-options "-O2" }

with Ada.Calendar; use Ada.Calendar;
with Opt90e_Pkg; use Opt90e_Pkg;

procedure Opt90e is
  B : constant Integer := Year (Clock);
  V : Data;

begin
  V := (R => (A => 0, B => B, C => 0, D => "000000000000"));
  if V.R.B /= B then
    raise Program_Error;
  end if;
end;
