# encoding: UTF-8

control "C-6.1.3" do
  title "Ensure permissions on /etc/gshadow- are configured"
  desc  "The `/etc/gshadow-` file is used to store backup information about
groups that is critical to the security of those accounts, such as the hashed
password and other security information."
  desc  "rationale", "It is critical to ensure that the `/etc/gshadow-` file is
protected from unauthorized access. Although it is protected by default, the
file permissions could be changed either inadvertently or through malicious
actions."
  desc  "check", "
    Run the following command and verify verify `Uid` is `0/root,` `Gid` is
`0/root` or `/shadow,` and `Access` is `640` or more restrictive:
    ```
    # stat /etc/gshadow-

    Access: (0640/-rw-r-----) Uid: ( 0/ root) Gid: ( 0/ root)
    ```
  "
  desc  "fix", "
    Run the one of the following chown commands as appropriate and the chmod to
set permissions on `/etc/gshadow-` :

    ```
    # chown root:root /etc/gshadow-
    ```

    **OR**

    ```
    # chown root:shadow /etc/gshadow-
    ```

    ```
    # chmod g-wx,o-rwx /etc/gshadow-
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
  tag cis_rid: "6.1.3"
end
