%%%-------------------------------------------------------------------
%%% @author aaron lelevier
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Nov 2019 2:52 PM
%%%-------------------------------------------------------------------
-module(commencal_server).
-author("aaron lelevier").
-behavior(gen_server).

%% gen_server
-export([init/1, handle_call/3, handle_cast/2]).

%% Module
-export([start_link/0, echo_time/0]).

%% gen_server API
init(State) ->
%%  timer:apply_interval(1000, ?MODULE, echo_time, []),
  timer:apply_interval(
    1000 * 60 * 30, % Every 30 minutes
    aemail, send_test_email, [] % MFA
  ),
  {ok, State}.

handle_call(_Request, _From, State) ->
  {reply, ok, State}.

handle_cast(_Request, State) ->
  {noreply, State}.

%% Module API
start_link() ->
  gen_server:start_link({local, ?MODULE}, ?MODULE, #{}, []).

echo_time() ->
  {{Year, Month, Day}, {Hour, Minute, Second}} = calendar:local_time(),
  io:format("Time: ~p/~p/~p ~p:~p:~p~n", [Year, Month, Day, Hour, Minute, Second]).

