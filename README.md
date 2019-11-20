# Erlang Game Machine (GM) Project

Demo repo for learning:

- OTP
- rebar3
- cowboy
- relx

# Project Setup

Install [rebar3](https://www.rebar3.org/docs/getting-started#section-installing-from-source) then:

```
git clone git@github.com:aaronlelevier/game_machine.git
cd game_machine/biking

# collects all packages and compiles them
rebar3 release

# starts apps and launches Erlang shell
rebar3 shell
```

Create new app

```
cd apps/
rebar3 new app <app_name>
```

# Notes

`cowboy` is set as a `dep` on the `api` app

`api` is then added as an app under the `relx` block of the `biking/rebar.config`, the top level `rebar.config` for the project

# References

[cowboy](https://ninenines.eu/docs/en/cowboy/2.7/guide/getting_started/) - REST library

[rebar3](https://www.rebar3.org/docs/basic-usage) - build tool

[relx](https://github.com/erlware/relx) - release tool

[rebar3 and cowboy blog](http://davekuhlman.org/rebar3-cowboy-rest-template.html) - blog on how to connect the dots

# License

MIT