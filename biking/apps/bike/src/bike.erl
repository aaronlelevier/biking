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
-export([start_link/1, get/2, set/3, compare/3]).

%% gen_server exports
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
  terminate/2, code_change/3]).

%% interface
start_link(Name) ->
  gen_server:start_link({local, Name}, ?MODULE, #{}, []).

%% sets a key/value State on the server
set(Name, Key, Data) ->
  gen_server:cast(Name, {set, Key, Data}).

%% returns a top level State value from the
get(Name, Key) ->
  gen_server:call(Name, {get, Key}).

%% compares two process's attributes using the `Key`
compare(Name1, Name2, Key) ->
  Geo1 = get(Name1, Key),
  Geo2 = get(Name2, Key),
  List1 = maps:to_list(Geo1),
  Diff = [{K, maps:get(K, Geo1) - maps:get(K, Geo2)}
    || {K, _V} <- List1],
  maps:from_list(Diff).

%% gen_server callbacks
init(State) -> {ok, State}.

handle_call({get, Key}, _From, State) ->
  {reply, maps:get(Key, State), State}.

handle_cast({set, Key, Data}, State) ->
  NewState = State#{Key => Data},
  logger:debug(NewState),
  {noreply, NewState}.

handle_info(_Info, State) -> {noreply, State}.
terminate(_Reason, _State) -> ok.
code_change(_OldVsn, State, _Extra) -> {ok, State}.
