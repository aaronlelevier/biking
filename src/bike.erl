%%%-------------------------------------------------------------------
%%% @author aaron lelevier
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Oct 2019 5:26 AM
%%%-------------------------------------------------------------------
-module(bike).
-author("aaron lelevier").
-behavior(gen_server).

%% interface exports
-export([start_link/1]).

%% debugging
-compile(export_all).

%% gen_server exports
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
  terminate/2, code_change/3]).

%% interface
start_link(Name) ->
  gen_server:start_link({local, Name}, ?MODULE, #{}, []).

%% sets the `geometry` state
geometry(Name, Data) ->
  gen_server:cast(Name, {geometry, Data}).

%% returns a top level State value from the
get(Name, Key) ->
  gen_server:call(Name, {get, Key}).

%% gen_server callbacks
init(State) -> {ok, State}.

handle_call({get, Key}, _From, State) ->
  {reply, maps:get(Key, State), State}.

handle_cast({geometry, Data}, State) ->
  NewState = State#{geometry => Data},
  logger:debug(NewState),
  {noreply, NewState}.

handle_info(_Info, State) -> {noreply, State}.
terminate(_Reason, _State) -> ok.
code_change(_OldVsn, State, _Extra) -> {ok, State}.
