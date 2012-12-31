-module(chatServer).
-export([init/0, loop/0]).

init() -> register(chatServer, spawn(chatServer, loop, [])).

loop() ->
	receive
		{From, Msg} ->
			Suffix = " was received.",
			NewMessage = string:concat(Msg , Suffix),
			io:format("~ts~n", [string:concat(Msg , Suffix)]),
			From ! {ok, NewMessage},
			loop();
		stop ->
			face
	end.
	