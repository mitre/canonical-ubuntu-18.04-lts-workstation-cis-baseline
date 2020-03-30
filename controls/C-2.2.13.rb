# encoding: UTF-8

control "C-2.2.13" do
  title "Ensure HTTP Proxy Server is not enabled"
  desc  "Squid is a standard proxy server used in many distributions and
environments."
  desc  "rationale", "If there is no need for a proxy server, it is recommended
that the squid proxy be deleted to reduce the potential attack surface."
  desc  "check", "
    Run the following command to verify `squid` is not enabled:

    ```
    # systemctl is-enabled squid

    disabled
    ```

    Verify result is not \"enabled\".
  "
  desc  "fix", "
    Run the following command to disable `squid`:

    ```
    # systemctl --now disable squid
    ```
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["CM-7 (1)", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["9.2", "Rev_7"]
  tag cis_rid: "2.2.13"
end

