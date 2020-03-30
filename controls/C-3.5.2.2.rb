# encoding: UTF-8

control "C-3.5.2.2" do
  title "Ensure default deny firewall policy"
  desc  "A default deny policy on connections ensures that any unconfigured
network usage will be rejected."
  desc  "rationale", "With a default accept policy the firewall will accept any
packet that is not configured to be denied. It is easier to white list
acceptable usage than to black list unacceptable usage."
  desc  "check", "
    Run the following command and verify that the default policy for
**incoming** , **outgoing** , and **routed** directions is **deny** or
**reject**:

    ```
    # ufw status verbose
    ```
  "
  desc  "fix", "
    Run the following commands to implement a default *deny* policy:

    ```
    # ufw default deny incoming
    ```

    ```
    # ufw default deny outgoing
    ```

    ```
    # ufw default deny routed
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
  tag nist: ["SC-7(5)", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["9.4", "Rev_7"]
  tag cis_rid: "3.5.2.2"
end

