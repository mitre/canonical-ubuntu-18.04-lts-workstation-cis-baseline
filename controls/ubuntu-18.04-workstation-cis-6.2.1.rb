# encoding: UTF-8

control "C-6.2.1" do
  title "Ensure password fields are not empty"
  desc  "An account with an empty password field means that anybody may log in
as that user without providing a password."
  desc  "rationale", "All accounts must have passwords or be locked to prevent
the account from being used by an unauthorized user."
  desc  "check", "
    Run the following command and verify that no output is returned:

    ```
    # awk -F: '($2 == \"\" ) { print $1 \" does not have a password \"}'
/etc/shadow
    ```
  "
  desc "fix", "
    If any accounts in the `/etc/shadow` file do not have a password, run the
following command to lock the account until it can be determined why it does
not have a password:

    ```
    # passwd -l
    ```

    Also, check to see if the account is logged in and investigate what it is
being used for to determine if it needs to be forced off.
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["IA-5 (1)", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["4.4", "Rev_7"]
  tag cis_rid: "6.2.1"
end
