-module(echo).
-export([go/0, loop/0]).

go() ->
	Pid = spawn(echo, loop, []),
	Pid ! {self(), "hello"},
	receive
		{Pid, Msg} ->
			io:format("~ts~n", [Msg])
	end,
	Pid ! stop.

loop() ->
	receive
		{From, Msg} ->
			Suffix = " dick.",
			NewMessage = string:concat(Msg , Suffix),
			io:format("~ts~n", [string:concat(Msg , Suffix)]),
			From ! {self(), NewMessage},
			loop();
		stop ->
			true
	end.