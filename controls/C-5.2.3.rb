# encoding: UTF-8

control "C-5.2.3" do
  title "Ensure permissions on SSH public host key files are configured"
  desc  "An SSH public key is one of two files used in SSH public key
authentication. In this authentication method, a public key is a key that can
be used for verifying digital signatures generated using a corresponding
private key. Only a public key that corresponds to a private key will be able
to authenticate successfully."
  desc  "rationale", "If a public host key file is modified by an unauthorized
user, the SSH service may be compromised."
  desc  "check", "
    Run the following command and verify Access does not grant write or execute
permissions to group or other for all returned files

    ```
    # find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec stat {} \\;

     File: ‘/etc/ssh/ssh_host_rsa_key.pub’
     Size: 382 Blocks: 8 IO Block: 4096 regular file
    Device: ca01h/51713d Inode: 8631758 Links: 1
    Access: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)
    Access: 2018-10-22 18:24:56.861750616 +0000
    Modify: 2018-10-22 18:24:56.861750616 +0000
    Change: 2018-10-22 18:24:56.881750616 +0000
     Birth: -
     File: ‘/etc/ssh/ssh_host_ecdsa_key.pub’
     Size: 162 Blocks: 8 IO Block: 4096 regular file
    Device: ca01h/51713d Inode: 8631761 Links: 1
    Access: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)
    Access: 2018-10-22 18:24:56.897750616 +0000
    Modify: 2018-10-22 18:24:56.897750616 +0000
    Change: 2018-10-22 18:24:56.917750616 +0000
     Birth: -
     File: ‘/etc/ssh/ssh_host_ed25519_key.pub’
     Size: 82 Blocks: 8 IO Block: 4096 regular file
    Device: ca01h/51713d Inode: 8631763 Links: 1
    Access: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)
    Access: 2018-10-22 18:24:56.945750616 +0000
    Modify: 2018-10-22 18:24:56.945750616 +0000
    Change: 2018-10-22 18:24:56.961750616 +0000
     Birth: -
    ```
  "
  desc  "fix", "
    Run the following commands to set permissions and ownership on the SSH host
public key files

    ```
    # find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chmod 0644
{} \\;
    ```

    ```
    # find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chown
root:root {} \\;
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
  tag cis_rid: "5.2.3"
end

