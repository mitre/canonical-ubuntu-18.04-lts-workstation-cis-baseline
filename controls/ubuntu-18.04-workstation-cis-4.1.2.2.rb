# encoding: UTF-8

control "C-4.1.2.2" do
  title "Ensure audit logs are not automatically deleted"
  desc  "The `max_log_file_action` setting determines how to handle the audit
log file reaching the max file size. A value of `keep_logs` will rotate the
logs but never delete old logs."
  desc  "rationale", "In high security contexts, the benefits of maintaining a
long audit history exceed the cost of storing the audit history."
  desc  "check", "
    Run the following command and verify output matches:

    ```
    # grep max_log_file_action /etc/audit/auditd.conf

    max_log_file_action = keep_logs
    ```
  "
  desc  "fix", "
    Set the following parameter in `/etc/audit/auditd.conf:`

    ```
    max_log_file_action = keep_logs
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
  tag cis_rid: "4.1.2.2"
end
