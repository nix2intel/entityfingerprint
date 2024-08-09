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

  This library was heavily inspired by the python tool [alephdata/fingerprints](https://github.com/alephdata/fingerprints)

  - A [Google Spreadsheet](https://docs.google.com/spreadsheets/d/1Cw2xQ3hcZOAgnnzejlY5Sv3OeMxKePTqcRhXQU8rCAw/edit?ts=5e7754cf#gid=0) created by OCCRP.

  - The ISO 20275: [Entity Legal Forms Code List](https://www.gleif.org/en/about-lei/code-lists/iso-20275-entity-legal-forms-code-list)

  - Wikipedia also maintains an index of [types of business entity](https://en.wikipedia.org/wiki/Types_of_business_entity).

  ## See also

  - [Clustering in Depth](https://github.com/OpenRefine/OpenRefine/wiki/Clustering-In-Depth), part of the OpenRefine documentation discussing how to create collisions in data clustering.
