# encoding: UTF-8

control "C-6.2.10" do
  title "Ensure users' dot files are not group or world writable"
  desc  "While the system administrator can establish secure permissions for
users' \"dot\" files, the users can easily override these."
  desc  "rationale", "Group or world-writable user configuration files may
enable malicious users to steal or modify other users' data or to gain another
user's system privileges."
  desc  "check", "
    Run the following script and verify no results are returned:

    ```
    #!/bin/bash

    grep -E -v '^(halt|sync|shutdown)' /etc/passwd | awk -F: '($7 !=
\"'\"$(which nologin)\"'\" & do
     if [ ! -d \"$dir\" ]; then
     echo \"The home directory \\\"$dir\\\" of user \\\"$user\\\" does not
exist.\"
     else
     for file in \"$dir\"/.[A-Za-z0-9]*; do
     if [ ! -h \"$file\" ] & then
     fileperm=\"$(ls -ld \"$file\" | cut -f1 -d\" \")\"
     if [ \"$(echo \"$fileperm\" | cut -c6)\" != \"-\" ]; then
     echo \"Group Write permission set on file $file\"
     fi
     if [ \"$(echo \"$fileperm\" | cut -c9)\" != \"-\" ]; then
     echo \"Other Write permission set on file \\\"$file\\\"\"
     fi
     fi
     done
     fi
    done
    ```
  "
  desc  "fix", "Making global modifications to users' files without alerting
the user community can result in unexpected outages and unhappy users.
Therefore, it is recommended that a monitoring policy be established to report
user dot file permissions and determine the action to be taken in accordance
with site policy."
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
  tag cis_rid: "6.2.10"
end

