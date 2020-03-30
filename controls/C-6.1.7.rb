# encoding: UTF-8

control "C-6.1.7" do
  title "Ensure permissions on /etc/shadow- are configured"
  desc  "The `/etc/shadow-` file is used to store backup information about user
accounts that is critical to the security of those accounts, such as the hashed
password and other security information."
  desc  "rationale", "It is critical to ensure that the `/etc/shadow-` file is
protected from unauthorized access. Although it is protected by default, the
file permissions could be changed either inadvertently or through malicious
actions."
  desc  "check", "
    Run the following command and verify verify `Uid` is `0/root,` `Gid` is
`0/root` or `/shadow,` and `Access` is `640` or more restrictive:

    ```
    # stat /etc/shadow-

    Access: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 42/ shadow)
    ```
  "
  desc  "fix", "
    Run the following commands to set permissions on `/etc/shadow-`:

    ```
    # chown root:shadow /etc/shadow-
    ```

    ```
    # chmod u-x,go-rwx /etc/shadow-
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
  tag nist: ["SC-28", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["16.4", "Rev_7"]
  tag cis_rid: "6.1.7"
end
