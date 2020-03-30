# encoding: UTF-8

control "C-3.4.3" do
  title "Ensure RDS is disabled"
  desc  "The Reliable Datagram Sockets (RDS) protocol is a transport layer
protocol designed to provide low-latency, high-bandwidth communications between
cluster nodes. It was developed by the Oracle Corporation."
  desc  "rationale", "If the protocol is not being used, it is recommended that
kernel module not be loaded, disabling the service to reduce the potential
attack surface."
  desc  "check", "
    Run the following commands and verify the output is as indicated:

    ```
    # modprobe -n -v rds

    install /bin/true
    ```

    ```
    # lsmod | grep rds

    ```
  "
  desc  "fix", "
    Edit or create a file in the `/etc/modprobe.d/` directory ending in .conf

    Example: `vi /etc/modprobe.d/rds.conf`

    and add the following line:

    ```
    install rds /bin/true
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
  tag cis_rid: "3.4.3"
end

