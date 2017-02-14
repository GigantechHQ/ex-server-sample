use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: :dev


environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"*<GXr}_k*-?)BU^rv!*e-hjkfG>!y}v13Wk>0%O.h4Y0yoz%f>lMMc5sRv]/T*T:"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"*<GXr}_k*-?)BU^rv!*e-hjkfG>!y}v13Wk>0%O.h4Y0yoz%f>lMMc5sRv]/T*T:"
end


release :ggtserver do
  set version: current_version(:ggtserver)
end
