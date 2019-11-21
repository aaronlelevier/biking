%%%-------------------------------------------------------------------
%%% @author aaron lelevier
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Nov 2019 6:04 AM
%%%-------------------------------------------------------------------
-module(bike_geometry_test).
-author("aaron lelevier").
-export([]).

-include_lib("eunit/include/eunit.hrl").

get_returns_geometry_on_match_test() ->
  ?assertEqual(
    {ok, bike_geometry:numbers(meta_am_29)},
    bike_geometry:get(meta_am_29)
  ).

get_returns_error_w_msg_on_failed_match_test() ->
  {error, Reason} = bike_geometry:get(not_a_bike),
  ?assertEqual(
    Reason,
    #{reason => not_found, bike => not_a_bike}
  ).