%%%-------------------------------------------------------------------
%% @doc bike public API
%% @end
%%%-------------------------------------------------------------------

-module(bike_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    bike_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
