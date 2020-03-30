# encoding: UTF-8

control "C-6.1.14" do
  title "Audit SGID executables"
  desc  "The owner of a file can set the file's permissions to run with the
owner's or group's permissions, even if the user running the program is not the
owner or a member of the group. The most common reason for a SGID program is to
enable users to perform functions (such as changing their password) that
require root privileges."
  desc  "rationale", "There are valid reasons for SGID programs, but it is
important to identify and review such programs to ensure they are legitimate.
Review the files returned by the action in the audit section and check to see
if system binaries have a different md5 checksum than what from the package.
This is an indication that the binary may have been replaced."
  desc  "check", "
    Run the following command to list SGID files:

    ```
    # df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}'
-xdev -type f -perm -2000
    ```

    The command above only searches local filesystems, there may still be
compromised items on network mounted partitions. Additionally the `--local`
option to `df` is not universal to all versions, it can be omitted to search
all filesystems on a system including network mounted filesystems or the
following command can be run manually for each partition:

    ```
    # find

    \t -xdev -type f -perm -2000
    ```
  "
  desc  "fix", "Ensure that no rogue SGID programs have been introduced into
the system. Review the files returned by the action in the Audit section and
confirm the integrity of these binaries."
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
  tag cis_rid: "6.1.14"
end

