%%%-------------------------------------------------------------------
%%% @author aaron lelevier
%%% @copyright (C) 2019, <COMPANY>
%%% @doc Example of serving a Map as JSON
%%%
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
  ?DEBUG({request, Req}),
  ?DEBUG({state, State}),

  % TODO: placeholder code documenting the decoded QueryString
  DecodedQs = cowboy_req:parse_qs(Req),
  ?DEBUG(DecodedQs),
  [{<<"bike">>,<<"meta_am_29">>}] = DecodedQs,

  Geometry = #{seat_tube_length => 465.0},
  Body = jsx:encode(Geometry),
  {Body, Req, State}.
