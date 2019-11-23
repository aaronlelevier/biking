%%%-------------------------------------------------------------------
%%% @author aaron lelevier
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Nov 2019 5:51 AM
%%%-------------------------------------------------------------------
-module(file_util).
-author("aaron lelevier").
-export([file_dir/0, find_file/1, full_filename/1]).

%% returns the file directory absolute path
%% will also create the file directory if it doesn't already exist
-spec file_dir() -> string().
file_dir() ->
  {ok, CurrentDir} = file:get_cwd(),
  DirName = "files",
  FileDir = filename:join([CurrentDir, DirName]),
  case filelib:is_dir(FileDir) of
    true ->
      ok;
    false ->
      ok = file:make_dir(DirName),
      ok
  end,
  FileDir.

%% searches for a file by filename in the "files" dir
-spec find_file(Filename :: filelib:filename()) ->
  {ok, filelib:filename()} | {error, not_found}.
find_file(Filename) ->
  filelib:find_file(Filename, file_dir()).

%% returns the absolute path of the Filename in the "files" dir
-spec full_filename(FileName :: filelib:filename()) -> filelib:filename().
full_filename(FileName) ->
  filename:join([file_util:file_dir(), FileName]).