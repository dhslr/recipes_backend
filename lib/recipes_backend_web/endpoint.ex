defmodule RecipesBackendWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :recipes_backend

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_recipes_backend_key",
    signing_salt: "2Msb1iHn",
    same_site: "Lax"
  ]

  socket "/socket", RecipesBackendWeb.UserSocket,
    websocket: true,
    longpoll: false

  plug Plug.Static.IndexHtml,
    at: "/"

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :recipes_backend,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  plug Plug.Static,
    at: "/",
    from: {:recipes_backend, "priv/static/recipes_web"},
    gzip: false,
    only:
      ~w(assets canvaskit icons index.html favicon.png main.dart.js main.dart.js.map manifest.json flutter_service_worker.js flutter.js)

  plug Plug.Static,
    at: "/photos",
    from: Path.expand("./priv/static/photos"),
    gzip: false

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :recipes_backend
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug CORSPlug

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug RecipesBackendWeb.Router
end
