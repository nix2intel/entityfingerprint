defmodule EntityFingerprint.FingerprintTest do
  use ExUnit.Case
  alias EntityFingerprint.Fingerprint

  test "create fingerprint for Siemens Aktiengesellschaft" do
    entity = "Siemens Aktiengesellschaft"

    assert Fingerprint.create(entity) ==
             {:ok,
              [fingerprint: "ag siemens", original: "Siemens Aktiengesellschaft", script: "latin"]}
  end

  test "create fingerprint for New York, New York" do
    entity = "New York, New York"

    assert Fingerprint.create(entity) ==
             {:ok, [fingerprint: "new york", original: "New York, New York", script: "latin"]}
  end
  
  test "create fingerprint for empty abbreviation" do
    entity = "CHAMBRE DE COMMERCE"

    assert Fingerprint.create(entity) ==
             {:error, "Entity perfectly matches abbreviation: CHAMBRE DE COMMERCE" } 
  end



  test "create fingerprint for Google" do
    entity = "Google Limited Liability Company    !!!"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "google llc",
                original: "Google Limited Liability Company    !!!",
                script: "latin"
              ]}
  end

  test "create fingerprint with emoji" do
    entity = " 💩 Limited Liability Company"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "llc poop",
                original: " 💩 Limited Liability Company",
                script: "common"
              ]}
  end

  test "create fingerprint for Google llc dba" do
    entity = "GOOGLE LLC (DBA)"

    assert Fingerprint.create(entity) ==
             {:ok, [fingerprint: "google llc", original: "GOOGLE LLC (DBA)", script: "latin"]}
  end

  test "create fingerprint Spark" do
    entity = "SPARK FOUNDRY (DBA)"

    assert Fingerprint.create(entity) ==
             {:ok,
              [fingerprint: "foundry spark", original: "SPARK FOUNDRY (DBA)", script: "latin"]}
  end

  test "create fingerprint Seoul Yakup Co.,Ltd" do
    entity = "Seoul Yakup Co.,Ltd"

    assert Fingerprint.create(entity) ==
             {:ok,
              [fingerprint: "coltd seoul yakup", original: "Seoul Yakup Co.,Ltd", script: "latin"]}
  end

  test "create fingerprint INSIGHT CANADA INC." do
    entity = "INSIGHT CANADA INC."

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "canada inc insight",
                original: "INSIGHT CANADA INC.",
                script: "latin"
              ]}
  end

  test "create fingerprint MARMARA ÜNİVERSİTESİ DÖNER SERMAYE" do
    entity = "MARMARA ÜNİVERSİTESİ DÖNER SERMAYE"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "doner marmara sermaye universitesi",
                original: "MARMARA ÜNİVERSİTESİ DÖNER SERMAYE",
                script: "latin"
              ]}
  end

  test "create fingerprint NCT HOLDINGS INC" do
    entity = "NCT HOLDINGS INC"

    assert Fingerprint.create(entity) ==
             {:ok,
              [fingerprint: "holdings inc nct", original: "NCT HOLDINGS INC", script: "latin"]}
  end

  test "create fingerprint ANTICIMEX" do
    entity = "ANTICIMEX"

    assert Fingerprint.create(entity) ==
             {:ok, [fingerprint: "anticimex", original: "ANTICIMEX", script: "latin"]}
  end

  test "create fingerprint INVENTIV HEALTH CLINICAL" do
    entity = "INVENTIV HEALTH CLINICAL"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "clinical health inventiv",
                original: "INVENTIV HEALTH CLINICAL",
                script: "latin"
              ]}
  end

  test "create fingerprint DOLPHIN GAYRIMENKUL" do
    entity = "DOLPHIN GAYRIMENKUL"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "dolphin gayrimenkul",
                original: "DOLPHIN GAYRIMENKUL",
                script: "latin"
              ]}
  end

  test "create fingerprint INSTITUTE PHARM. SERVICES" do
    entity = "INSTITUTE PHARM. SERVICES"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "institute pharm services",
                original: "INSTITUTE PHARM. SERVICES",
                script: "latin"
              ]}
  end

  test "create fingerprint MAGYAR TELEKOM NYRT" do
    entity = "MAGYAR TELEKOM NYRT"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "magyar nyrt telekom",
                original: "MAGYAR TELEKOM NYRT",
                script: "latin"
              ]}
  end

  test "create fingerprint IMAGEN ENSAYOS CLINICOS S.L." do
    entity = "IMAGEN ENSAYOS CLINICOS S.L."

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "clinicos ensayos imagen sl",
                original: "IMAGEN ENSAYOS CLINICOS S.L.",
                script: "latin"
              ]}
  end

  test "create fingerprint SYNEOS HEALTH HUNGARY KFT" do
    entity = "SYNEOS HEALTH HUNGARY KFT"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "health hungary kft syneos",
                original: "SYNEOS HEALTH HUNGARY KFT",
                script: "latin"
              ]}
  end

  test "create fingerprint WIND TRE S.P.A." do
    entity = "WIND TRE S.P.A."

    assert Fingerprint.create(entity) ==
             {:ok, [fingerprint: "spa tre wind", original: "WIND TRE S.P.A.", script: "latin"]}
  end

  test "create fingerprint BHS HOTEL AG" do
    entity = "BHS HOTEL AG"

    assert Fingerprint.create(entity) ==
             {:ok, [fingerprint: "ag bhs hotel", original: "BHS HOTEL AG", script: "latin"]}
  end

  test "create fingerprint SYNEOS HEALTH NETHERLANDS B.V." do
    entity = "SYNEOS HEALTH NETHERLANDS B.V."

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "bv health netherlands syneos",
                original: "SYNEOS HEALTH NETHERLANDS B.V.",
                script: "latin"
              ]}
  end

  test "create fingerprint HAAS & HEALTH PARTNER PUBLIC RELATI" do
    entity = "HAAS & HEALTH PARTNER PUBLIC RELATI"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "haas health partner public relati",
                original: "HAAS & HEALTH PARTNER PUBLIC RELATI",
                script: "latin"
              ]}
  end

  test "create fingerprint INVENTIV HEALTH SWEDEN AB" do
    entity = "INVENTIV HEALTH SWEDEN AB"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "ab health inventiv sweden",
                original: "INVENTIV HEALTH SWEDEN AB",
                script: "latin"
              ]}
  end

  test "create fingerprint SYNEOS HEALTH FRANCE SARL" do
    entity = "SYNEOS HEALTH FRANCE SARL"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "france health sarl syneos",
                original: "SYNEOS HEALTH FRANCE SARL",
                script: "latin"
              ]}
  end

  test "create fingerprint CESKA POSTA,S.P." do
    entity = "CESKA POSTA,S.P."

    assert Fingerprint.create(entity) ==
             {:ok, [fingerprint: "ceska postasp", original: "CESKA POSTA,S.P.", script: "latin"]}
  end

  test "create fingerprint SYNEOS HEALTH CZ S.R.O." do
    entity = "SYNEOS HEALTH CZ S.R.O."

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "cz health sro syneos",
                original: "SYNEOS HEALTH CZ S.R.O.",
                script: "latin"
              ]}
  end

  test "create fingerprint GALEN-SYMPOSION S.R.O." do
    entity = "GALEN-SYMPOSION S.R.O."

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "galensymposion sro",
                original: "GALEN-SYMPOSION S.R.O.",
                script: "latin"
              ]}
  end

  test "create fingerprint ICON CLINICAL RESEARCH LTD" do
    entity = "ICON CLINICAL RESEARCH LTD"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "clinical icon ltd research",
                original: "ICON CLINICAL RESEARCH LTD",
                script: "latin"
              ]}
  end

  test "create fingerprint CEPHEID" do
    entity = "CEPHEID"

    assert Fingerprint.create(entity) ==
             {:ok, [fingerprint: "cepheid", original: "CEPHEID", script: "latin"]}
  end

  test "create fingerprint HOLOGIC, INC" do
    entity = "HOLOGIC, INC"

    assert Fingerprint.create(entity) ==
             {:ok, [fingerprint: "hologic inc", original: "HOLOGIC, INC", script: "latin"]}
  end

  test "create fingerprint BRACKET GLOBAL, L.L.C." do
    entity = "BRACKET GLOBAL, L.L.C."

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "bracket global llc",
                original: "BRACKET GLOBAL, L.L.C.",
                script: "latin"
              ]}
  end

  test "create fingerprint COVANCE LABORATORIES" do
    entity = "COVANCE LABORATORIES"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "covance laboratories",
                original: "COVANCE LABORATORIES",
                script: "latin"
              ]}
  end

  test "create fingerprint WATERMARK RESEARCH PARTNERS," do
    entity = "WATERMARK RESEARCH PARTNERS,"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "partners research watermark",
                original: "WATERMARK RESEARCH PARTNERS,",
                script: "latin"
              ]}
  end

  test "create fingerprint SIGNANT HEALTH GLOBAL LLC" do
    entity = "SIGNANT HEALTH GLOBAL LLC"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "global health llc signant",
                original: "SIGNANT HEALTH GLOBAL LLC",
                script: "latin"
              ]}
  end

  test "create fingerprint CAMBRIDGE ENTERPRISE LIMITED" do
    entity = "CAMBRIDGE ENTERPRISE LIMITED"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "cambridge enterprise limited",
                original: "CAMBRIDGE ENTERPRISE LIMITED",
                script: "latin"
              ]}
  end

  test "create fingerprint JOHN WILEY AND SONS INC" do
    entity = "JOHN WILEY AND SONS INC"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "and inc john sons wiley",
                original: "JOHN WILEY AND SONS INC",
                script: "latin"
              ]}
  end

  test "create fingerprint for 佐贤鸣智（上海）企业管理咨询有限公司" do
    entity = "佐贤鸣智（上海）企业管理咨询有限公司"

    assert Fingerprint.create(entity) ==
             {:ok,
              [
                fingerprint: "guanlizixun shanghai zuoxianmingzhi",
                original: "佐贤鸣智（上海）企业管理咨询有限公司",
                script: "han"
              ]}
  end
end
