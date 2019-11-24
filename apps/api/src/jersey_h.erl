%%%-------------------------------------------------------------------
%%% @author aaron lelevier
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Nov 2019 5:50 AM
%%%-------------------------------------------------------------------
-module(jersey_h).
-author("aaron lelevier").
-export([]).

%% debug
-compile(export_all).
-define(DEBUG(X), io:format("MOD:~p LINE:~p ~p~n", [?MODULE, ?LINE, X])).


init(Req, Opts) ->
  {cowboy_rest, Req, Opts}.

content_types_provided(Req, State) ->
  {[
    {<<"application/json">>, json_handler}
  ], Req, State}.

json_handler(Req, State) ->
  Resp = case cowboy_req:parse_qs(Req) of
           [] ->
             #{message => <<"needs query param: ?bike=bike_name">>};
           [{Key, Val}] ->
             #{param => #{Key => Val}},
             ?DEBUG(Val),
             % query by size
             db:select_by_size(binary_to_list(Val))
         end,
  Body = jsx:encode([item:to_map(X) || X <- Resp]),
  {Body, Req, State}.


