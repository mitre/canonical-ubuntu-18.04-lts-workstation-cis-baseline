# encoding: UTF-8

control "C-4.1.7" do
  title "Ensure login and logout events are collected"
  desc  "Monitor login and logout events. The parameters below track changes to
files associated with login/logout events. The file `/var/log/faillog` tracks
failed events from login. The file `/var/log/lastlog` maintain records of the
last time a user successfully logged in. The file `/var/log/tallylog` maintains
records of failures via the `pam_tally2` module"
  desc  "rationale", "Monitoring login/logout events could provide a system
administrator with information associated with brute force attacks against user
logins."
  desc  "check", "
    Run the following commands:

    ```
    # grep logins /etc/audit/rules.d/*.rules
    ```

    Verify output includes:

    ```
    -w /var/log/faillog -p wa -k logins
    -w /var/log/lastlog -p wa -k logins
    -w /var/log/tallylog -p wa -k logins
    ```

    ```
    # auditctl -l | grep logins
    ```

    Verify output includes:

    ```
    -w /var/log/faillog -p wa -k logins
    -w /var/log/lastlog -p wa -k logins
    -w /var/log/tallylog -p wa -k logins
    ```
  "
  desc  "fix", "
    Edit or create a file in the `/etc/audit/rules.d/` directory ending in
`.rules`

    Example: `vi /etc/audit/rules.d/logins.rules`

    and add the following lines:

    ```
    -w /var/log/faillog -p wa -k logins
    -w /var/log/lastlog -p wa -k logins
    -w /var/log/tallylog -p wa -k logins
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
  tag nist: ["AU-2", "AC-11", "AC-2(12)", "Rev_4"]
  tag cis_level: 4
  tag cis_controls: ["4.9", "16.11", "16.13", "Rev_7"]
  tag cis_rid: "4.1.7"
end

