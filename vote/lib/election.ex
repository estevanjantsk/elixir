defmodule Election do
  defstruct name: "Mayor",
            candidates: [
              Candidate.new(1, "Candidato 1"),
              Candidate.new(2, "Candidato 2")
            ],
            next_id: 3

  def view_header(election) do
    [
      "Election for: #{election.name}\n"
    ]
  end
end
