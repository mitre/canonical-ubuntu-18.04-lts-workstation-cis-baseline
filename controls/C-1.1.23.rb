# encoding: UTF-8

control "C-1.1.23" do
  title "Disable USB Storage"
  desc  "USB storage provides a means to transfer and store files insuring
persistence and availability of the files independent of network connection
status. Its popularity and utility has led to USB-based malware being a simple
and common means for network infiltration and a first step to establishing a
persistent threat within a networked environment."
  desc  "rationale", "Restricting USB access on the system will decrease the
physical attack surface for a device and diminish the possible vectors to
introduce malware."
  desc  "check", "
    Run the following commands and verify the output is as indicated:

    ```
    # modprobe -n -v usb-storage

    install /bin/true
    ```

    ```
    # lsmod | grep usb-storage

    ```
  "
  desc  "fix", "
    Edit or create a file in the /etc/modprobe.d/ directory ending in .conf

    Example: vi /etc/modprobe.d/usb_storage.conf
    and add the following line:

    ```
    install usb-storage /bin/true
    ```

    Run the following command to unload the usb-storage module:

    ```
    rmmod usb-storage
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
  tag nist: ["SI-3", "SC-18(4)", "Rev_4"]
  tag cis_level: 4
  tag cis_controls: ["8.4", "8.5", "Rev_7"]
  tag cis_rid: "1.1.23"
end

