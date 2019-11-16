%%%-------------------------------------------------------------------
%%% @author aaron lelevier
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Nov 2019 11:21 AM
%%%-------------------------------------------------------------------
-module(model_test).
-author("aaron lelevier").
-compile(export_all).

-include_lib("eunit/include/eunit.hrl").

simple_test() ->
  ?assert(true).

model_send_returns_event_test() ->
  Data = #{count => 42},

  Pid = model:start_link(),
  logger:debug(Pid),

  Event = model:send(Data),

  ?assertEqual(
    maps:get(data, Event),
    Data).
