# encoding: UTF-8

control "C-2.2.8" do
  title "Ensure DNS Server is not enabled"
  desc  "The Domain Name System (DNS) is a hierarchical naming system that maps
names to IP addresses for computers, services and other resources connected to
a network."
  desc  "rationale", "Unless a system is specifically designated to act as a
DNS server, it is recommended that the package be deleted to reduce the
potential attack surface."
  desc  "check", "
    Run the following command to verify `DNS server` is not enabled:

    ```
    # systemctl is-enabled bind9

    disabled
    ```

    Verify result is not \"enabled\".
  "
  desc  "fix", "
    Run the following commands to disable `DNS server`:

    ```
    # systemctl --now disable bind9
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
  tag cis_rid: "2.2.8"
end

