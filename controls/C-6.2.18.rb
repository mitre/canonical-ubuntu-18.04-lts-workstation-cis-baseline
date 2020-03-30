# encoding: UTF-8

control "C-6.2.18" do
  title "Ensure no duplicate user names exist"
  desc  "Although the `useradd` program will not let you create a duplicate
user name, it is possible for an administrator to manually edit the
`/etc/passwd` file and change the user name."
  desc  "rationale", "If a user is assigned a duplicate user name, it will
create and have access to files with the first UID for that username in
`/etc/passwd` . For example, if \"test4\" has a UID of 1000 and a subsequent
\"test4\" entry has a UID of 2000, logging in as \"test4\" will use UID 1000.
Effectively, the UID is shared, which is a security problem."
  desc  "check", "
    Run the following script and verify no results are returned:

    ```
    #!/bin/bash

    cut -d: -f1 /etc/passwd | sort | uniq -d | while read -r usr; do
     echo \"Duplicate login name \\\"$usr\\\" in /etc/passwd\"
    done
    ```
  "
  desc  "fix", "Based on the results of the audit script, establish unique user
names for the users. File ownerships will automatically reflect the change as
long as the users have unique UIDs."
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AC-2", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["16", "Rev_7"]
  tag cis_rid: "6.2.18"
end

