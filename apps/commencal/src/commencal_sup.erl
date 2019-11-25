%%%-------------------------------------------------------------------
%% @doc commencal top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(commencal_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    ChildSpecs = [{
      commencal_server1, {commencal_server, start_link, []},
      permanent,
      10000,
      worker,
      [commencal_server]
    }],
    {ok, {SupFlags, ChildSpecs}}.

%% internal functions
