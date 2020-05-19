# encoding: UTF-8

control "C-5.2.11" do
  title "Ensure SSH PermitEmptyPasswords is disabled"
  desc  "The `PermitEmptyPasswords` parameter specifies if the SSH server
allows login to accounts with empty password strings."
  desc  "rationale", "Disallowing remote shell access to accounts that have an
empty password reduces the probability of unauthorized access to the system"
  desc  "check", "
    Run the following command and verify that output matches:

    ```
    # sshd -T | grep permitemptypasswords

    PermitEmptyPasswords no
    ```
  "
  desc "fix", "
    Edit the `/etc/ssh/sshd_config` file to set the parameter as follows:

    ```
    PermitEmptyPasswords no
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
  tag cis_rid: "5.2.11"
end
