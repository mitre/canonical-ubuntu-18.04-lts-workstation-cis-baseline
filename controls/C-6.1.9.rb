# encoding: UTF-8

control "C-6.1.9" do
  title "Ensure permissions on /etc/gshadow are configured"
  desc  "The `/etc/gshadow` file is used to store the information about groups
that is critical to the security of those accounts, such as the hashed password
and other security information."
  desc  "rationale", "If attackers can gain read access to the `/etc/gshadow`
file, they can easily run a password cracking program against the hashed
password to break it. Other security information that is stored in the
`/etc/gshadow` file (such as group administrators) could also be useful to
subvert the group."
  desc  "check", "
    Run the following command and verify `Uid` is `0/root,` `Gid` is `/shadow,`
and `Access` is `640` or more restrictive:

    ```
    # stat /etc/gshadow

    Access: (0640/-rw-r-----) Uid: ( 0/ root) Gid: ( 42/ shadow)
    ```
  "
  desc  "fix", "
    Run the following commands to set permissions on `/etc/gshadow`:

    ```
    # chown root:shadow /etc/gshadow

    # chmod o-rwx,g-wx /etc/gshadow
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
  tag cis_rid: "6.1.9"
end

