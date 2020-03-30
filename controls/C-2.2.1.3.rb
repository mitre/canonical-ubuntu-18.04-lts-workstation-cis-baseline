# encoding: UTF-8

control "C-2.2.1.3" do
  title "Ensure chrony is configured"
  desc  "`chrony` is a daemon which implements the Network Time Protocol (NTP)
is designed to synchronize system clocks across a variety of systems and use a
source that is highly accurate. More information on `chrony` can be found at .
`chrony` can be configured to be a client and/or a server."
  desc  "rationale", "
    If chrony is in use on the system proper configuration is vital to ensuring
time synchronization is working properly.

    This recommendation only applies if chrony is in use on the system.
  "
  desc  "check", "
    Run the following command and verify remote server is configured properly:

    ```
    # grep -E \"^(server|pool)\" /etc/chrony.conf
    server
    ```

    Multiple servers may be configured.

    Run the following command and verify the first field for the `chronyd`
process is `chrony`:

    ```
    # ps -ef | grep chronyd
    chrony 491 1 0 20:32 ? 00:00:00 /usr/sbin/chronyd
    ```
  "
  desc  "fix", "
    Add or edit server or pool lines to `/etc/chrony.conf` as appropriate:

    ```
    server
    ```

    Configure `chrony` to run as the `chrony` user by configuring the
appropriate startup script for your distribution. Startup scripts are typically
stored in `/etc/init.d` or `/etc/systemd`.
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AU-8 (2)", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["6.1", "Rev_7"]
  tag cis_rid: "2.2.1.3"
end
