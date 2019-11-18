%%%-------------------------------------------------------------------
%%% @author aaron lelevier
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. Nov 2019 7:48 PM
%%%-------------------------------------------------------------------
-module(factory).
-author("aaron lelevier").
-compile(export_all).
-export([]).

bike(meta_am_29, geometry) ->
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
bike(meta_ht_am, geometry) ->
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