require "spec_helper"

describe Lita::Handlers::EchoSd, lita_handler: true do
  it { is_expected.to route_command("echo-sd").to(:echo_sd) }
  it { is_expected.to route_command("echo-sd test").to(:echo_sd) }
  it { is_expected.to route_command("echo-sdv").to(:echo_sd) }
  it { is_expected.to route_command("echo-sdv test").to(:echo_sd) }
end
