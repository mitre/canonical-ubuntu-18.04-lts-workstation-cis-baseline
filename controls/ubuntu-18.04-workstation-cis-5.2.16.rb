# encoding: UTF-8

control "C-5.2.16" do
  title "Ensure SSH Idle Timeout Interval is configured"
  desc  "The two options `ClientAliveInterval` and `ClientAliveCountMax`
control the timeout of ssh sessions. When the `ClientAliveInterval` variable is
set, ssh sessions that have no activity for the specified length of time are
terminated. When the `ClientAliveCountMax` variable is set, `sshd` will send
client alive messages at every `ClientAliveInterval` interval. When the number
of consecutive client alive messages are sent with no response from the client,
the `ssh` session is terminated. For example, if the `ClientAliveInterval` is
set to 15 seconds and the `ClientAliveCountMax` is set to 3, the client `ssh`
session will be terminated after 45 seconds of idle time."
  desc  "rationale", "
    Having no timeout value associated with a connection could allow an
unauthorized user access to another user's `ssh` session (e.g. user walks away
from their computer and doesn't lock the screen). Setting a timeout value at
least reduces the risk of this happening..

    While the recommended setting is 300 seconds (5 minutes), set this timeout
value based on site policy. The recommended setting for `ClientAliveCountMax`
is 0. In this case, the client session will be terminated after 5 minutes of
idle time and no keepalive messages will be sent.
  "
  desc  "check", "
    Run the following commands and verify `ClientAliveInterval` is between 1
and 300 and `ClientAliveCountMax` is 3 or less:

    ```
    # sshd -T | grep clientaliveinterval

    ClientAliveInterval 300
    ```

    ```
    # sshd -T | grep clientalivecountmax

    ClientAliveCountMax 0
    ```
  "
  desc "fix", "
    Edit the `/etc/ssh/sshd_config` file to set the parameters according to
site policy:

    ```
    ClientAliveInterval 300

    ClientAliveCountMax 0
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
  tag nist: ["AC-11", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["16.11", "Rev_7"]
  tag cis_rid: "5.2.16"
end
