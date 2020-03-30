# encoding: UTF-8

control "C-5.2.12" do
  title "Ensure SSH PermitUserEnvironment is disabled"
  desc  "The `PermitUserEnvironment` option allows users to present environment
options to the `ssh` daemon."
  desc  "rationale", "Permitting users the ability to set environment variables
through the SSH daemon could potentially allow users to bypass security
controls (e.g. setting an execution path that has `ssh` executing trojan'd
programs)"
  desc  "check", "
    Run the following command and verify that output matches:

    ```
    # sshd -T | grep permituserenvironment

    PermitUserEnvironment no
    ```
  "
  desc "fix", "
    Edit the `/etc/ssh/sshd_config` file to set the parameter as follows:

    ```
    PermitUserEnvironment no
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
  tag nist: ["AC-3 (3)", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["14.6", "Rev_7"]
  tag cis_rid: "5.2.12"
end
