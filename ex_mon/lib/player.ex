defmodule ExMon.Player do
  @required_keys [:life, :moves, :name]
  @max_file 100

  @enforce_keys @required_keys
  defstruct @required_keys

  def build(name, move_avg, move_rnd, move_heal) do
    %ExMon.Player{
      life: @max_file,
      moves: %{
        move_avg: move_avg,
        move_heal: move_heal,
        move_rnd: move_rnd
      },
      name: name
    }
  end
end
