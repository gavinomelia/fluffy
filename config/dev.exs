use Mix.Config

config :phoenix, Fluffy.Router,
  port: System.get_env("PORT") || 4000,
  ssl: false,
  code_reload: true,
  cookies: true,
  consider_all_requests_local: true,
  session_key: "_fluffy_key",
  session_secret: "J1#15KBD7%S155F5QZ*3@E(EP2S@!IO(PP$&PU@$HQM$84_&YQB9N^LXX8TJ^U$XT_TY!#&7#I("

config :phoenix, :logger,
  level: :debug


