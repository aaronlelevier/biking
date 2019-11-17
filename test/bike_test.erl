%%%-------------------------------------------------------------------
%%% @author aaron lelevier
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Nov 2019 11:21 AM
%%%-------------------------------------------------------------------
-module(bike_test).
-author("aaron lelevier").
-compile(export_all).
-include_lib("eunit/include/eunit.hrl").

simple_test() ->
  ?assert(true).

geometry_test() ->
  Name = meta_am,
  {ok, _Pid} = bike:start_link(Name),
  Geometry = #{reach => 460},
  ?assertEqual(ok, bike:geometry(Name, Geometry)),
  ?assertEqual(Geometry, bike:get(Name, geometry)).
