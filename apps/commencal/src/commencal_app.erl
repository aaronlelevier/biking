%%%-------------------------------------------------------------------
%% @doc commencal public API
%% @end
%%%-------------------------------------------------------------------

-module(commencal_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    commencal_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
