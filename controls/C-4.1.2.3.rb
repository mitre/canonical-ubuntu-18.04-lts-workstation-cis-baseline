# encoding: UTF-8

control "C-4.1.2.3" do
  title "Ensure system is disabled when audit logs are full"
  desc  "The `auditd` daemon can be configured to halt the system when the
audit logs are full."
  desc  "rationale", "In high security contexts, the risk of detecting
unauthorized access or nonrepudiation exceeds the benefit of the system's
availability."
  desc  "check", "
    Run the following commands and verify output matches:

    ```
    # grep space_left_action /etc/audit/auditd.conf

    space_left_action = email
    ```

    ```
    # grep action_mail_acct /etc/audit/auditd.conf

    action_mail_acct = root
    ```

    ```
    # grep admin_space_left_action /etc/audit/auditd.conf

    admin_space_left_action = halt
    ```
  "
  desc  "fix", "
    Set the following parameters in `/etc/audit/auditd.conf:`

    ```
    space_left_action = email
    action_mail_acct = root
    admin_space_left_action = halt
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
  tag nist: ["AU-4", "Rev_4"]
  tag cis_level: 4
  tag cis_controls: ["6.4", "Rev_7"]
  tag cis_rid: "4.1.2.3"
end

