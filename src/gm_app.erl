%%%-------------------------------------------------------------------
%% @doc gm public API
%% @end
%%%-------------------------------------------------------------------

-module(gm_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    gm_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
