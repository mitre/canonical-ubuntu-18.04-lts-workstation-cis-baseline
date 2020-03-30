# encoding: UTF-8

control "C-5.2.21" do
  title "Ensure SSH AllowTcpForwarding is disabled"
  desc  "SSH port forwarding is a mechanism in SSH for tunneling application
ports from the client to the server, or servers to clients. It can be used for
adding encryption to legacy applications, going through firewalls, and some
system administrators and IT professionals use it for opening backdoors into
the internal network from their home machines"
  desc  "rationale", "
    Leaving port forwarding enabled can expose the organization to security
risks and back-doors.

    SSH connections are protected with strong encryption. This makes their
contents invisible to most deployed network monitoring and traffic filtering
solutions. This invisibility carries considerable risk potential if it is used
for malicious purposes such as data exfiltration. Cybercriminals or malware
could exploit SSH to hide their unauthorized communications, or to exfiltrate
stolen data from the target network
  "
  desc  "check", "
    Run the following command and verify that output matches:

    ```
    # sshd -T | grep -i allowtcpforwarding

    AllowTcpForwarding no
    ```
  "
  desc  "fix", "
    Edit the /etc/ssh/sshd_config file to set the parameter as follows:

    ```
    AllowTcpForwarding no
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
  tag nist: ["CM-7 (1)", "Rev_4"]
  tag cis_level: 4
  tag cis_controls: ["9.2", "Rev_7"]
  tag cis_rid: "5.2.21"
end

