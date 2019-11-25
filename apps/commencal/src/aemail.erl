%%%-------------------------------------------------------------------
%%% @author aaron lelevier
%%% @copyright (C) 2019, <COMPANY>
%%% @doc aemail - stands form "Aaron Email"
%%% Module for doing email in this demo app for learning Erlang
%%% @end
%%% Created : 25. Nov 2019 1:28 PM
%%%-------------------------------------------------------------------
-module(aemail).
-author("aaron lelevier").
-export([send_test_email/0]).

send_test_email() ->
  gen_smtp_client:send(
    {
      "aaron.lelevier@gmail.com", % To
      [], % Bcc
      "Subject: Meta AM HT\r\nFrom: Erlang Aaron \r\nTo: Aaron \r\n\r\nBike: Meta AM HT\nPrice: " ++ get_price()
    }, [
      {relay, "smtp.gmail.com"},
      {ssl, true},
      {username, os:getenv("GMAIL_USERNAME")},
      {password, os:getenv("GMAIL_PASSWORD")}
    ]
  ).

get_price() ->
  Url = "https://www.commencalusa.com/meta-ht-am-origin-2019-c2x26304818",
  L = web:fetch_page(Url),
  web:get_price(L).

