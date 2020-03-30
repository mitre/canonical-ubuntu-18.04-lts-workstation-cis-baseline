# encoding: UTF-8

control "C-4.1.6" do
  title "Ensure events that modify the system's Mandatory Access Controls are
collected"
  desc  "Monitor AppArmor mandatory access controls. The parameters below
monitor any write access (potential additional, deletion or modification of
files in the directory) or attribute changes to `/etc/apparmor` and
`/etc/apparmor.d` directories."
  desc  "rationale", "Changes to files in these directories could indicate that
an unauthorized user is attempting to modify access controls and change
security contexts, leading to a compromise of the system."
  desc  "check", "
    run the following commands:

    ```
    # grep MAC-policy /etc/audit/rules.d/*.rules
    ```

    Verify output matches:

    ```
    -w /etc/apparmor/ -p wa -k MAC-policy
    -w /etc/apparmor.d/ -p wa -k MAC-policy
    ```

    ```
    # auditctl -l | grep MAC-policy
    ```

    Verify output matches:

    ```
    -w /etc/apparmor/ -p wa -k MAC-policy
    -w /etc/apparmor.d/ -p wa -k MAC-policy
    ```
  "
  desc "fix", "
    Edit or create a file in the `/etc/audit/rules.d/` directory ending in
`.rules`

    Example: `vi /etc/audit/rules.d/MAC-policy.rules`

    and add the following lines:

    ```
    -w /etc/apparmor/ -p wa -k MAC-policy
    -w /etc/apparmor.d/ -p wa -k MAC-policy
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
  tag nist: ["CM-6 (1)", "Rev_4"]
  tag cis_level: 4
  tag cis_controls: ["5.5", "Rev_7"]
  tag cis_rid: "4.1.6"
end
