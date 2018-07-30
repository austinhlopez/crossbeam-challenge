defmodule Challenge do
  def main(datasets) do
    HTTPoison.start()    
    maps = datasets |>
      Enum.map(fn dataset ->	
	url = "https://s3.amazonaws.com/challenge.getcrossbeam.com/public/" <> dataset <> ".json"

	response = HTTPoison.get!(url)
	obj = response.body |> Poison.decode!

	company_map = obj["companies"] |>
	  Enum.reduce(MapSet.new(), fn company, mapset ->
	    mapset |> MapSet.put(company["domain"])
	  end)

	IO.write(Integer.to_string(MapSet.size(company_map)) <> " ")

	company_map
      end)

    [first, second] = maps
    IO.puts MapSet.size(MapSet.intersection(first, second))
  end
end
