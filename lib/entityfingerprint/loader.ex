defmodule EntityFingerprint.Loader do
  @abbreviation_file Path.join(:code.priv_dir(:entityfingerprint), "abbreviations.json")

  @doc """
  This function simply reads the abbreviations.json in priv/ and builds a map object that is used for doing abbreviations.
  """
  def load_abbreviations do
    @abbreviation_file
    |> File.read!()
    |> Jason.decode!()
    |> Enum.reduce(%{}, fn %{"legal_form_local_name" => full, "abbreviations" => abbr}, acc ->
      Map.put(acc, full, abbr)
    end)
  end
end
