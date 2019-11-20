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
-include_lib("eunit/include/eunit.hrl").

%% TODO: should probably move to a `setup` function
init_procs_test() ->
  Name1 = meta_am_29,
  Name2 = meta_ht_am,
  % init bikes
  {ok, _Pid1} = bike:start_link(Name1),
  {ok, _Pid2} = bike:start_link(Name2).

can_set_and_get_state_test() ->
  Name = meta_am_29,
  Key = geometry,

  Geometry = factory:bike(Name, Key),

  ?assertEqual(ok, bike:set(Name, Key, Geometry)),
  ?assertEqual(Geometry, bike:get(Name, Key)).

compare_shows_diff_between_two_processes_test() ->
  Name1 = meta_am_29,
  Name2 = meta_ht_am,
  % set geometry
  Key = geometry,
  bike:set(Name1, Key, factory:bike(Name1, Key)),
  bike:set(Name2, Key, factory:bike(Name2, Key)),

  Ret = bike:compare(Name1, Name2, Key),

  ?assertEqual(
    #{bottom_bracket_heigth => 15.0,
      chain_stay_length => 0.0,
      fork_length => 16.0,
      head_tube_angle => 0.5,
      head_tube_length => -10.0,
      reach => 15.0,
      seat_tube_angle => 2.5,
      seat_tube_length => -25.0,
      stack => -5.5,
      standover_height => 3.0,
      top_tupe_length => -9.0,
      wheelbase => 17.0},
    Ret).