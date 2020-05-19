# encoding: UTF-8

control "C-1.8.1.5" do
  title "Ensure permissions on /etc/issue are configured"
  desc  "The contents of the `/etc/issue` file are displayed to users prior to
login for local terminals."
  desc  "rationale", "If the `/etc/issue` file does not have the correct
ownership it could be modified by unauthorized users with incorrect or
misleading information."
  desc  "check", "
    Run the following command and verify `Uid` and `Gid` are both `0/root` and
`Access` is `644` :

    ```
    # stat /etc/issue

    Access: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)
    ```
  "
  desc  "fix", "
    Run the following commands to set permissions on `/etc/issue` :

    ```
    # chown root:root /etc/issue
    ```

    ```
    # chmod u-x,go-wx /etc/issue
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
  tag nist: ["CM-6", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["5.1", "Rev_7"]
  tag cis_rid: "1.8.1.5"
end
