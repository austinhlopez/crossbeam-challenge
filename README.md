# crossbeam-challenge

### Instructions
* git clone this repo
* Install docker-compose: [Docker-Compose](https://docs.docker.com/compose/install/)
* cd docker
* docker-compose run challenge \<dataset1\> \<dataset2\>


### Main File

```defmodule Challenge do                                                 
  def main(datasets) do                                                
    HTTPoison.start()                                                  
    # map over list of datasets                                        
    maps = Enum.map(datasets,                                          
      fn dataset ->                                                    
       url = "https://s3.amazonaws.com/challenge.getcrossbeam.com/pub\
lic/" <> dataset <> ".json"                                            
                                                                       
        response = HTTPoison.get!(url)                                 
                                                                       
        # extract domains                                              
        obj = response.body |> Poison.decode!                          
        company_map = obj["companies"] |>                              
          Enum.reduce(MapSet.new(), fn company, mapset ->              
            mapset |> MapSet.put(company["domain"])                    
          end)                                                         
                                                                       
        # write unique domain count                                    
        IO.write(Integer.to_string(MapSet.size(company_map)) <> " ")   
                                                                       
        company_map                                                    
      end                                                              
    )                                                                  
                                                                       
    [first, second] = maps                                             
    # print the unique domains overlapping                             
    IO.puts MapSet.size(MapSet.intersection(first, second))            
  end                                                                  
end
```

### Next Steps
* Ansible Playbook (if docker/docker-compose isnt desired)
* HTTP server/endpoint
* Unit testing w/ dummy data, response status handling
* multi-file command line (find overlap on domains for N datasets, not just 2)
* optional type checking, process monitoring
