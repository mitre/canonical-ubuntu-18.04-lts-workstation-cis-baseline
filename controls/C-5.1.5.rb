# encoding: UTF-8

control "C-5.1.5" do
  title "Ensure permissions on /etc/cron.weekly are configured"
  desc  "The `/etc/cron.weekly` directory contains system cron jobs that need
to run on a weekly basis. The files in this directory cannot be manipulated by
the `crontab` command, but are instead edited by system administrators using a
text editor. The commands below restrict read/write and search access to user
and group root, preventing regular users from accessing this directory."
  desc  "rationale", "Granting write access to this directory for
non-privileged users could provide them the means for gaining unauthorized
elevated privileges. Granting read access to this directory could give an
unprivileged user insight in how to gain elevated privileges or circumvent
auditing controls."
  desc  "check", "
    Run the following command and verify `Uid` and `Gid` are both `0/root` and
`Access` does not grant permissions to `group` or `other` :

    ```
    # stat /etc/cron.weekly

    Access: (0700/drwx------) Uid: ( 0/ root) Gid: ( 0/ root)
    ```
  "
  desc  "fix", "
    Run the following commands to set ownership and permissions on
`/etc/cron.weekly` :

    ```
    # chown root:root /etc/cron.weekly
    ```

    ```
    # chmod og-rwx /etc/cron.weekly
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
  tag cis_rid: "5.1.5"
end
