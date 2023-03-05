defmodule PhxSaas.MembersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhxSaas.Members` context.
  """

  @doc """
  Generate a member.
  """
  def member_fixture(attrs \\ %{}) do
    {:ok, member} =
      attrs
      |> Enum.into(%{

      })
      |> PhxSaas.Members.create_member()

    member
  end
end
