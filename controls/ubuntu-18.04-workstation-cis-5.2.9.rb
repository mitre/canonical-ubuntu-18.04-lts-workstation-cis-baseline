# encoding: UTF-8

control "C-5.2.9" do
  title "Ensure SSH HostbasedAuthentication is disabled"
  desc  "The `HostbasedAuthentication` parameter specifies if authentication is
allowed through trusted hosts via the user of `.rhosts`, or `/etc/hosts.equiv`,
along with successful public key client host authentication. This option only
applies to SSH Protocol Version 2."
  desc  "rationale", "Even though the `.rhosts` files are ineffective if
support is disabled in `/etc/pam.conf`, disabling the ability to use `.rhosts`
files in SSH provides an additional layer of protection."
  desc  "check", "
    Run the following command and verify that output matches:

    ```
    # sshd -T | grep hostbasedauthentication

    HostbasedAuthentication no
    ```
  "
  desc "fix", "
    Edit the `/etc/ssh/sshd_config` file to set the parameter as follows:

    ```
    HostbasedAuthentication no
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
  tag nist: ["IA-2 (1)", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["16.3", "Rev_7"]
  tag cis_rid: "5.2.9"
end
