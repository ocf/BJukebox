FROM erlang:alpine
RUN ["apk", "add", "git", "curl", "python3", "autossh"]
WORKDIR "/BJukebox"
ADD . .
RUN ["curl", "-o", "rebar3", "https://s3.amazonaws.com/rebar3/rebar3"]
RUN ["chmod", "+x", "./rebar3"]
RUN ["pip3", "install", "youtube-dl"]
RUN ["./rebar3", "release"]
CMD ["_build/default/rel/jukebox_server/bin/jukebox_server", "foreground"]

