%%%-------------------------------------------------------------------
%%% @author aaron lelevier
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Nov 2019 5:48 AM
%%%-------------------------------------------------------------------
-module(bike_geometry).
-author("aaron lelevier").
-export([get/1, numbers/1]).

-spec get(BikeName :: atom()) -> {ok|error, map()}.
get(BikeName) ->
  try
    {ok, numbers(BikeName)}
  catch
    error:function_clause ->
      {error, #{reason => not_found, bike => BikeName}}
  end.

%% Bike geometry maps to use for testing
numbers(meta_am_29) ->
  #{seat_tube_length => 465.0,
    seat_tube_angle => 76.5,
    head_tube_angle => 65.5,
    head_tube_length => 115.0,
    wheelbase => 1222.0,
    top_tupe_length => 619.0,
    chain_stay_length => 432.0,
    bottom_bracket_heigth => -25.0,
    fork_length => 571.0,
    standover_height => 750.0,
    reach => 460.0,
    stack => 633.5
  };
numbers(meta_ht_am) ->
  #{seat_tube_length => 490.0,
    seat_tube_angle => 74.0,
    head_tube_angle => 65.0,
    head_tube_length => 125.0,
    wheelbase => 1205.0,
    top_tupe_length => 628.0,
    chain_stay_length => 432,
    bottom_bracket_heigth => -40.0,
    fork_length => 555.0,
    standover_height => 747.0,
    reach => 445.0,
    stack => 639.0
  }.
