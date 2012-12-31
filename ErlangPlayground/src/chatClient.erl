-module(chatClient).
-export([say/1]).

say(Msg) -> 
	{chatServer, 'node1@node1.gaddieind.com'} ! {self(), Msg},
  receive
    {ok, Res} ->
      	Res
    after 1000 ->
		{error, timeout}
  end.