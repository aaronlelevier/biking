%%%-------------------------------------------------------------------
%% @doc api public API
%% @end
%%%-------------------------------------------------------------------

-module(api_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
        {'_', [
            {"/", toppage_h, []},
            {"/geometry", geometry_h, []},
            {"/jersey", jersey_h, []}
        ]}
    ]),
    {ok, _} = cowboy:start_clear(http, [{port, 8080}], #{
        env => #{dispatch => Dispatch}
    }),
    api_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
