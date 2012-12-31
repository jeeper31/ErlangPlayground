-module(member).
-export([member/2]).

member(_, [])		-> false;
member(H, [H | _])	-> true;
member(H, [_ | T])	-> member(H, T).