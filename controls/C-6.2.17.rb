# encoding: UTF-8

control "C-6.2.17" do
  title "Ensure no duplicate GIDs exist"
  desc  "Although the `groupadd` program will not let you create a duplicate
Group ID (GID), it is possible for an administrator to manually edit the
`/etc/group` file and change the GID field."
  desc  "rationale", "User groups must be assigned unique GIDs for
accountability and to ensure appropriate access protections."
  desc  "check", "
    Run the following script and verify no results are returned:

    ```
    #!/bin/bash

    cut -d: -f3 /etc/group | sort | uniq -d | while read x ; do
     echo \"Duplicate GID ($x) in /etc/group\"
    done
    ```
  "
  desc  "fix", "Based on the results of the audit script, establish unique GIDs
and review all files owned by the shared GID to determine which group they are
supposed to belong to."
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
  tag cis_rid: "6.2.17"
end

