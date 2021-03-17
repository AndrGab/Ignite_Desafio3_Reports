defmodule ReportsFreelas do
  alias ReportsFreelas.Parser
  @moduledoc false
  @users [
    "Cleiton",
    "Daniele",
    "Danilo",
    "Diego",
    "Giuliano",
    "Jakeliny",
    "Joseph",
    "Mayk",
    "Rafael",
    "Vinicius"
  ]
  @nm_month %{
    1 => "janeiro",
    2 => "fevereiro",
    3 => "marco",
    4 => "abril",
    5 => "maio",
    6 => "junho",
    7 => "julho",
    8 => "agosto",
    9 => "setembro",
    10 => "outubro",
    11 => "novembro",
    12 => "dezembro"
  }
  @list_month [
    "janeiro",
    "fevereiro",
    "marco",
    "abril",
    "maio",
    "junho",
    "julho",
    "agosto",
    "setembro",
    "outubro",
    "novembro",
    "dezembro"
  ]

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values([name, hour, _day, month, year], %{
         all_hours: all_hours,
         hours_per_month: hours_per_month,
         hours_per_year: hours_per_year
       }) do
    all_hours = build_map(all_hours, name, hour)

    hours_per_month =
      Map.put(hours_per_month, name, build_map(hours_per_month[name], @nm_month[month], hour))

    hours_per_year = Map.put(hours_per_year, name, build_map(hours_per_year[name], year, hour))

    %{
      all_hours: all_hours,
      hours_per_month: hours_per_month,
      hours_per_year: hours_per_year
    }
  end

  defp report_acc() do
    years = Enum.into(2016..2020, %{}, &{&1, 0})
    months = Enum.into(@list_month, %{}, &{&1, 0})
    all_hours = Enum.into(@users, %{}, &{&1, 0})
    hours_per_year = Enum.into(@users, %{}, &{&1, years})
    hours_per_month = Enum.into(@users, %{}, &{&1, months})

    %{
      all_hours: all_hours,
      hours_per_month: hours_per_month,
      hours_per_year: hours_per_year
    }
  end

  defp build_map(map, key, value) do
    Map.put(map, key, map[key] + value)
  end
end
