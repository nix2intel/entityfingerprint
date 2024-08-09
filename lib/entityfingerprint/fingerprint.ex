defmodule EntityFingerprint.Fingerprint do
  alias EntityFingerprint.Loader

  @abbreviations Loader.load_abbreviations()

    @doc """
  Creates a fingerprint for the given entity name. It supports special character, emojis (because we all know that emoji's in company names are coming), and entity types in other non-latin scripts.

  ## Examples

    ```
    iex(1)> EntityFingerprint.create("ФИЛИАЛ КОМПАНИИ С ОГРАНИЧЕННОЙ")

    {:ok,
    [
      fingerprint: "filial kompanii ogranichennoy s",
      original: "ФИЛИАЛ КОМПАНИИ С ОГРАНИЧЕННОЙ",
      script: "cyrillic"
    ]}

    iex(2)> EntityFingerprint.create("ООО КУРЬЕР-РЕГИОН СТОЛИЦА")

    {:ok,
    [
      fingerprint: "kurerregion ooo stolitsa",
      original: "ООО КУРЬЕР-РЕГИОН СТОЛИЦА",
      script: "cyrillic"
    ]}

    iex(3)> EntityFingerprint.create("Google Limited Liability Company")

    {:ok,
    [
      fingerprint: "google llc",
      original: "Google Limited Liability Company",
      script: "latin"
    ]}

    iex(4)> EntityFingerprint.create("현대해상화재보험")

    {:ok,
    [
      fingerprint: "hyeondaehaesanghwajaeboheom",
      original: "현대해상화재보험",
      script: "hangul"
    ]}

    iex(5)> EntityFingerprint.create(" 💩 Limited Liability Company")

    {:ok,
    [
      fingerprint: "llc poop",
      original: " 💩 Limited Liability Company",
      script: "common"
    ]}

    iex(6)> EntityFingerprint.create("佐贤鸣智（上海）企业管理咨询有限公司")
    {:ok,
    [
      fingerprint: "guanlizixun shanghai zuoxianmingzhi",
      original: "佐贤鸣智（上海）企业管理咨询有限公司",
      script: "han"
    ]}

    iex(7)> EntityFingerprint.create("Siemens Aktiengesellschaft")
    {:ok,
    [
      fingerprint: "ag siemens",
      original: "Siemens Aktiengesellschaft",
      script: "latin"
    ]}

    iex(8)> EntityFingerprint.create("New York, New York")
    {:ok,
    [fingerprint: "new york", original: "New York, New York", script: "latin"]}
    ```
  ## Thanks

    This library was heavily inspired by the python tool \[alephdata\/fingerprints\](https://github.com/alephdata/fingerprints)

    - A \[Google Spreadsheet\](https://docs.google.com/spreadsheets/d/1Cw2xQ3hcZOAgnnzejlY5Sv3OeMxKePTqcRhXQU8rCAw/edit?ts=5e7754cf#gid=0) created by OCCRP.

    - The ISO 20275: \[Entity Legal Forms Code List\](https://www.gleif.org/en/about-lei/code-lists/iso-20275-entity-legal-forms-code-list)

    - Wikipedia also maintains an index of \[types of business entity\](https://en.wikipedia.org/wiki/Types_of_business_entity).

  ## See also

    - \[Clustering in Depth\](https://github.com/OpenRefine/OpenRefine/wiki/Clustering-In-Depth), part of the OpenRefine documentation discussing how to create collisions in data clustering.
  """
  def create(entity) do
    abbreviated_entity = abbreviate_entity(entity)
    fingerprint = create_fingerprint(abbreviated_entity)
    #We use the abbreviated entity to gat the script, because of potential whitespace at beginning of word
    [script_atom | _] = Unicode.script(abbreviated_entity)
    script = Atom.to_string(script_atom)
    {:ok, fingerprint: fingerprint, original: entity, script: script}
  end

  defp abbreviate_entity(entity) do
    entity
    |> String.trim()
    |> replace_abbreviations()
  end

  defp replace_abbreviations(text) do
    Enum.reduce(@abbreviations, text, fn {full, abbr}, acc ->
      String.replace(acc, full, abbr, global: false)
    end)
  end

  defp create_fingerprint(abbreviated_entity) do
    case Unicode.script(abbreviated_entity) do
      [:latin | _] ->
        generate_fingerprint(abbreviated_entity)

      [:common | _] ->
        abbreviated_entity
        |> AnyAscii.transliterate()
        |> IO.chardata_to_string()
        |> generate_fingerprint()
      _ ->
        abbreviated_entity
        |> String.trim()
        |> String.split(~r/[^[:alnum:]-]/u, trim: true)
        |> AnyAscii.transliterate()
        |> Enum.join(" ")
        |> generate_fingerprint()
    end
  end

  defp generate_fingerprint(transformed_entity) do
    transformed_entity
    |> String.normalize(:nfd)
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9\s]/u, "")
    |> String.replace(~r/\s+/, " ")
    |> String.split()
    |> Enum.uniq()
    |> Enum.sort()
    |> Enum.join(" ")
  end
end
