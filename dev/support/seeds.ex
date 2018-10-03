defmodule Rexmakesurworld.Seeds do

  def run() do
    alias Rexmakesurworld.{Project, Repo}

    # (Echt veel te vaag allemaal, maar dient technisch het doel van testen.)
    _concreet_begin =
      %Project{
        title: "Een concreet begin",
        description: "Iets maken dat echt is en indrukwekkend."
      }
      |> Repo.insert!
    _huis =
      %Project{
        title: "Grof conceptueel spuiwerk voor bewoning.",
        description: "Studies en oplossingen voor iets dat je een thuis kan noemen. Enkel interieur loft-achtige oplossingen ook denkbaar."
      }
      |> Repo.insert!
    _werkplaats =
      %Project{
        title: "Grof conceptueel spuiwerk voor een werkplaats.",
        description: "Studies en oplossingen voor een atelier."
      }
      |> Repo.insert!
    _landschap =
      %Project{
        title: "Vrije landschapsconcepten",
        description: "Allerlei ideeën verzameld die impact kunnen hebben regiobreed."
      }
      |> Repo.insert!

    :ok
  end
end
