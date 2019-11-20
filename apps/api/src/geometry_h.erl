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

init(Req, Opts) ->
  {cowboy_rest, Req, Opts}.

content_types_provided(Req, State) ->
  {[
    {<<"application/json">>, geometry_json}
  ], Req, State}.

geometry_json(Req, State) ->
  Geometry = #{seat_tube_length => 465.0},
  Body = jsx:encode(Geometry),
  {Body, Req, State}.
