# encoding: UTF-8

control "C-3.5.2.3" do
  title "Ensure loopback traffic is configured"
  desc  "Configure the loopback interface to accept traffic. Configure all
other interfaces to deny traffic to the loopback network (127.0.0.0/8 for IPv4
and ::1/128 for IPv6)."
  desc  "rationale", "Loopback traffic is generated between processes on
machine and is typically critical to operation of the system. The loopback
interface is the only place that loopback network (127.0.0.0/8 for IPv4 and
::1/128 for IPv6) traffic should be seen, all other interfaces should ignore
traffic on this network as an anti-spoofing measure."
  desc  "check", "
    Run the following commands and verify output includes the listed rules in
order:

    ```
    # ufw status verbose
    ```

    ```
    To Action From
    -- ------ ----
    Anywhere on lo ALLOW IN Anywhere
    Anywhere DENY IN 127.0.0.0/8
    Anywhere (v6) on lo ALLOW IN Anywhere (v6)
    Anywhere (v6) DENY IN ::1

    Anywhere ALLOW OUT Anywhere on lo
    Anywhere (v6) ALLOW OUT Anywhere (v6) on lo
    ```
  "
  desc  "fix", "
    Run the following commands to implement the loopback rules:

    ```
    # ufw allow in on lo
    ```

    ```
    # ufw deny in from 127.0.0.0/8
    ```

    ```
    # ufw deny in from ::1
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
  tag nist: ["SC-7(5)", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["9.4", "Rev_7"]
  tag cis_rid: "3.5.2.3"
end
