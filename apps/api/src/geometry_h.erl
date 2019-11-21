%%%-------------------------------------------------------------------
%%% @author aaron lelevier
%%% @copyright (C) 2019, <COMPANY>
%%% @doc Queries a bike geometry and returns it if found
%%% else returns error msg
%%%
%%% Example url for this handler:
%%%   http://localhost:8080/geometry?bike=meta_ht_am
%%% @end
%%% Created : 20. Nov 2019 6:16 AM
%%%-------------------------------------------------------------------
-module(geometry_h).
-author("aaron lelevier").
-compile(export_all).
-export([]).

-define(DEBUG(X), io:format("MOD:~p LINE:~p ~p~n", [?MODULE, ?LINE, X])).

init(Req, Opts) ->
  {cowboy_rest, Req, Opts}.

content_types_provided(Req, State) ->
  {[
    {<<"application/json">>, geometry_json}
  ], Req, State}.

geometry_json(Req, State) ->
  Resp = case cowboy_req:parse_qs(Req) of
    [] ->
      #{message => <<"needs query param: ?bike=bike_name">>};
    [{_Key, Val}] ->
      BikeName = binary_to_atom(Val, utf8),
      {_, Geo} = bike_geometry:get(BikeName),
      Geo
  end,
  Body = jsx:encode(Resp),
  {Body, Req, State}.
