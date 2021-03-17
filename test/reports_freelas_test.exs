defmodule ReportsFreelasTest do
  use ExUnit.Case

  describe "Build/1" do
    test "Generate a sample report with worked hours by user/month/year" do
      expected_result = %{
        all_hours: %{
          "Cleiton" => 24,
          "Daniele" => 25,
          "Danilo" => 7,
          "Diego" => 19,
          "Giuliano" => 14,
          "Jakeliny" => 39,
          "Joseph" => 17,
          "Mayk" => 33,
          "Rafael" => 22,
          "Vinicius" => 0
        },
        hours_per_month: %{
          "Cleiton" => %{
            "abril" => 5,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 7,
            "junho" => 4,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 8,
            "setembro" => 0
          },
          "Daniele" => %{
            "abril" => 7,
            "agosto" => 0,
            "dezembro" => 5,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 5,
            "maio" => 8,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Danilo" => %{
            "abril" => 1,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 6,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Diego" => %{
            "abril" => 4,
            "agosto" => 4,
            "dezembro" => 1,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 1,
            "marco" => 6,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 3
          },
          "Giuliano" => %{
            "abril" => 1,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 9,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 4,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Jakeliny" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 9,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 8,
            "junho" => 0,
            "maio" => 0,
            "marco" => 14,
            "novembro" => 0,
            "outubro" => 8,
            "setembro" => 0
          },
          "Joseph" => %{
            "abril" => 4,
            "agosto" => 0,
            "dezembro" => 2,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 3,
            "novembro" => 5,
            "outubro" => 0,
            "setembro" => 3
          },
          "Mayk" => %{
            "abril" => 4,
            "agosto" => 0,
            "dezembro" => 5,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 7,
            "junho" => 3,
            "maio" => 0,
            "marco" => 3,
            "novembro" => 4,
            "outubro" => 0,
            "setembro" => 7
          },
          "Rafael" => %{
            "abril" => 0,
            "agosto" => 11,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 4,
            "julho" => 7,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Vinicius" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "marco" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          }
        },
        hours_per_year: %{
          "Cleiton" => %{2016 => 3, 2017 => 5, 2018 => 7, 2019 => 0, 2020 => 9},
          "Daniele" => %{2016 => 10, 2017 => 3, 2018 => 7, 2019 => 0, 2020 => 5},
          "Danilo" => %{2016 => 0, 2017 => 0, 2018 => 1, 2019 => 6, 2020 => 0},
          "Diego" => %{2016 => 3, 2017 => 8, 2018 => 7, 2019 => 1, 2020 => 0},
          "Giuliano" => %{2016 => 0, 2017 => 3, 2018 => 0, 2019 => 6, 2020 => 5},
          "Jakeliny" => %{2016 => 16, 2017 => 9, 2018 => 0, 2019 => 12, 2020 => 2},
          "Joseph" => %{2016 => 0, 2017 => 3, 2018 => 0, 2019 => 3, 2020 => 11},
          "Mayk" => %{2016 => 11, 2017 => 8, 2018 => 0, 2019 => 7, 2020 => 7},
          "Rafael" => %{2016 => 0, 2017 => 18, 2018 => 0, 2019 => 0, 2020 => 4},
          "Vinicius" => %{2016 => 0, 2017 => 0, 2018 => 0, 2019 => 0, 2020 => 0}
        }
      }

      result = ReportsFreelas.build("gen_test.csv")
      assert result == expected_result
    end
  end
end
