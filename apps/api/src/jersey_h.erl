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
-compile(export_all).


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
             #{param => #{Key => Val}}
         end,
  Body = jsx:encode(Resp),
  {Body, Req, State}.


