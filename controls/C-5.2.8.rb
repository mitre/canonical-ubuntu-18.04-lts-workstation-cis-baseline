# encoding: UTF-8

control "C-5.2.8" do
  title "Ensure SSH IgnoreRhosts is enabled"
  desc  "The `IgnoreRhosts` parameter specifies that `.rhosts` and `.shosts`
files will not be used in `RhostsRSAAuthentication` or
`HostbasedAuthentication`."
  desc  "rationale", "Setting this parameter forces users to enter a password
when authenticating with ssh."
  desc  "check", "
    Run the following command and verify that output matches:

    ```
    # sshd -T | grep ignorerhosts

    IgnoreRhosts yes
    ```
  "
  desc  "fix", "
    Edit the `/etc/ssh/sshd_config` file to set the parameter as follows:

    ```
    IgnoreRhosts yes
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
  tag cis_rid: "5.2.8"
end

