defmodule Challenge.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  def find_by_username_and_password(conn, uname, pw) do
    IO.inspect("finding by!")
    IO.inspect(conn)
    IO.inspect(conn |> fetch_query_params)
    IO.inspect(uname)
    IO.inspect(pw)
    conn
  end

  get "/"  do
    IO.inspect(conn)

    find_by_username_and_password(conn, "testing", "three")
    
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, "Hello. World!!")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end

  #def handle(request, state) do
    #plug BasicAuth, use_config: {:challenge, :basic_auth}

    #IO.inspect("request!")
    #get "/:first/:second" do
    #datasets = [conn.params["first"], conn.params["second"]]
    #Challenge.main(datasets)    
    #|> put_resp_content_type("text/html")
    #|> send_resp(200, "Password Protected!")
    #end
    # { :ok, reply } = :cowboy_req.reply(
    #  200, [{"content-type", "text/html"}], "<h1>Hello World!</h1>", request)
   # { :ok, reply, state}  
  # end

  # def terminate(_reason, _request, _state), do: :ok
end
